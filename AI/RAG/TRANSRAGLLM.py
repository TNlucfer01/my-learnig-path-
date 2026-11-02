from flask import Flask, request, jsonify
from flask_cors import CORS
import fitz  # PyMuPDF
from rank_bm25 import BM25Okapi
from sentence_transformers import SentenceTransformer, util
import glob
import os
from typing import List, Tuple
import openai  # or anthropic, or use local models

# -----------------------------
# CONFIGURATION
# -----------------------------
PDF_FOLDER = "./Dataset"
TOP_K_BM25 = 10

# LLM Configuration - Choose ONE:
LLM_PROVIDER = "ollama"
LLM_MODEL = "llama3.2:3b"
OLLAMA_BASE_URL = "http://localhost:11434" # or "claude-3-sonnet", "llama3", etc.

# For local models (Ollama)

# -----------------------------
# Initialize Flask app
# -----------------------------
app = Flask(__name__)
CORS(app)

# Global variables
texts = []
sources = []
bm25 = None
embedder = None

# -----------------------------
# PDF Loading (with smart chunking)
# -----------------------------
def smart_chunk_text(text: str, chunk_size: int = 500, overlap: int = 100) -> List[str]:
    """Smart text chunking with sentence boundary preservation"""
    import re
    paragraphs = text.split('\n\n')
    chunks = []
    current_chunk = ""
    
    for para in paragraphs:
        if not para.strip():
            continue
        sentences = re.split(r'(?<=[.!?])\s+', para)
        
        for sentence in sentences:
            if len(current_chunk) + len(sentence) > chunk_size:
                if current_chunk:
                    chunks.append(current_chunk.strip())
                    current_chunk = current_chunk[-overlap:] + " " + sentence
                else:
                    current_chunk = sentence
            else:
                current_chunk += " " + sentence if current_chunk else sentence
    
    if current_chunk:
        chunks.append(current_chunk.strip())
    
    return chunks

def load_all_pdfs(pdf_folder: str) -> Tuple[List[str], List[str]]:
    texts, sources = [], []
    pdf_files = glob.glob(os.path.join(pdf_folder, "*.pdf"))
    
    if not pdf_files:
        raise FileNotFoundError(f"No PDFs found in {pdf_folder}")
    
    for pdf_path in pdf_files:
        doc = fitz.open(pdf_path)
        pdf_name = os.path.basename(pdf_path)
        
        for page_num, page in enumerate(doc):
            page_text = page.get_text("text").strip()
            if not page_text:
                continue
            
            chunks = smart_chunk_text(page_text, chunk_size=500, overlap=100)
            for chunk_idx, chunk in enumerate(chunks):
                texts.append(chunk)
                sources.append(f"{pdf_name} - page {page_num+1}, chunk {chunk_idx+1}")
        
        doc.close()
    
    print(f"Loaded {len(texts)} optimized chunks from {len(pdf_files)} PDFs.")
    return texts, sources

# -----------------------------
# Build BM25 index
# -----------------------------
def build_bm25(texts: List[str]) -> BM25Okapi:
    tokenized = [t.split() for t in texts]
    bm25 = BM25Okapi(tokenized)
    print("BM25 index ready.")
    return bm25

# -----------------------------
# Retrieval with semantic reranking
# -----------------------------
def retrieve(query: str, bm25: BM25Okapi, texts: List[str], 
             sources: List[str], embedder: SentenceTransformer, 
             top_k: int) -> List[Tuple[str, str, float]]:
    # BM25 retrieval
    bm25_hits = bm25.get_top_n(query.split(), texts, n=TOP_K_BM25)
    hit_sources = [sources[texts.index(h)] for h in bm25_hits]
    
    # Semantic reranking
    query_emb = embedder.encode([query])
    result_embs = embedder.encode(bm25_hits)
    scores = util.cos_sim(query_emb, result_embs)[0]
    
    ranked = sorted(zip(bm25_hits, hit_sources, scores), 
                   key=lambda x: x[2], reverse=True)
    
    return ranked[:top_k]

# -----------------------------
# LLM Integration - Multiple Providers
# -----------------------------
def generate_answer_with_llm(query: str, contexts: List[str]) -> str:
    """
    Generate natural language answer using LLM
    """
    if not contexts:
        return "I couldn't find any relevant information in the documents to answer your question."
    
    # Build context string
    context_str = "\n\n".join([f"[Source {i+1}]: {ctx}" for i, ctx in enumerate(contexts)])
    
    # Create prompt
    system_prompt = """You are Studie, an AI study assistant. Answer questions based ONLY on the provided context from documents. 
If the context doesn't contain enough information, say so clearly. Be concise, accurate, and educational."""
    
    user_prompt = f"""Context from documents:
{context_str}

Question: {query}

Please provide a clear, accurate answer based on the context above. If the context doesn't contain the information needed, say so."""

    # Choose LLM provider
    try:
        if LLM_PROVIDER == "openai":
            return generate_with_openai(system_prompt, user_prompt)
        elif LLM_PROVIDER == "anthropic":
            return generate_with_anthropic(system_prompt, user_prompt)
        elif LLM_PROVIDER == "ollama":
            return generate_with_ollama(system_prompt, user_prompt)
        elif LLM_PROVIDER == "groq":
            return generate_with_groq(system_prompt, user_prompt)
        else:
            # Fallback to basic summary
            return generate_basic_summary(query, contexts)
    except Exception as e:
        print(f"LLM Error: {str(e)}")
        return generate_basic_summary(query, contexts)

# -----------------------------
# OpenAI Integration
# -----------------------------
def generate_with_openai(system_prompt: str, user_prompt: str) -> str:
    """Generate using OpenAI GPT"""
    from openai import OpenAI
    
    client = OpenAI(api_key=LLM_API_KEY)
    response = client.chat.completions.create(
        model=LLM_MODEL,
        messages=[
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt}
        ],
        temperature=0.7,
        max_tokens=500
    )
    return response.choices[0].message.content

# -----------------------------
# Anthropic (Claude) Integration
# -----------------------------
def generate_with_anthropic(system_prompt: str, user_prompt: str) -> str:
    """Generate using Anthropic Claude"""
    import anthropic
    
    client = anthropic.Anthropic(api_key=LLM_API_KEY)
    message = client.messages.create(
        model=LLM_MODEL,
        max_tokens=500,
        system=system_prompt,
        messages=[
            {"role": "user", "content": user_prompt}
        ]
    )
    return message.content[0].text

# -----------------------------
# Ollama (Local) Integration
# -----------------------------
def generate_with_ollama(system_prompt: str, user_prompt: str) -> str:
    """Generate using local Ollama"""
    import requests
    
    response = requests.post(
        f"{OLLAMA_BASE_URL}/api/generate",
        json={
            "model": LLM_MODEL,
            "prompt": f"{system_prompt}\n\n{user_prompt}",
            "stream": False
        }
    )
    return response.json()["response"]

# -----------------------------
# Groq Integration (Fast inference)
# -----------------------------
def generate_with_groq(system_prompt: str, user_prompt: str) -> str:
    """Generate using Groq"""
    from groq import Groq
    
    client = Groq(api_key=LLM_API_KEY)
    response = client.chat.completions.create(
        model=LLM_MODEL,
        messages=[
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt}
        ],
        temperature=0.7,
        max_tokens=500
    )
    return response.choices[0].message.content

# -----------------------------
# Fallback: Basic Summary (No LLM)
# -----------------------------
def generate_basic_summary(query: str, contexts: List[str]) -> str:
    """Fallback when no LLM is available"""
    answer = f"Based on your question about '{query}', here are the most relevant sections:\n\n"
    for i, ctx in enumerate(contexts, 1):
        snippet = ctx[:200] + "..." if len(ctx) > 200 else ctx
        answer += f"{i}. {snippet}\n\n"
    return answer.strip()

# -----------------------------
# Initialize system
# -----------------------------
@app.before_request
def initialize():
    global texts, sources, bm25, embedder
    
    if bm25 is None:
        print("Initializing RAG system...")
        texts, sources = load_all_pdfs(PDF_FOLDER)
        bm25 = build_bm25(texts)
        # Use better embedding model
        embedder = SentenceTransformer("BAAI/bge-large-en-v1.5")
        print("RAG system ready with BGE embeddings!")

# -----------------------------
# API Endpoint
# -----------------------------
@app.route('/query', methods=['POST', 'OPTIONS'])
def query_documents():
    if request.method == 'OPTIONS':
        return '', 200
    
    try:
        data = request.get_json()
        
        if not data or "query" not in data or "top_k" not in data:
            return jsonify({"error": "Missing required fields"}), 400
        
        query = data["query"]
        top_k = data["top_k"]
        
        if not isinstance(query, str) or not query.strip():
            return jsonify({"error": "Invalid query"}), 400
        
        if not isinstance(top_k, int) or top_k <= 0:
            return jsonify({"error": "Invalid top_k"}), 400
        
        # Retrieve relevant contexts
        results = retrieve(query, bm25, texts, sources, embedder, top_k)
        contexts = [r[0] for r in results]
        
        # Generate natural language answer with LLM
        answer = generate_answer_with_llm(query, contexts)
        
        return jsonify({
            "answer": answer,
            "contexts": contexts
        }), 200
        
    except Exception as e:
        print(f"Error: {str(e)}")
        return jsonify({"error": f"Internal server error: {str(e)}"}), 500

# -----------------------------
# Health check
# -----------------------------
@app.route('/health', methods=['GET'])
def health_check():
    return jsonify({
        "status": "healthy",
        "documents_loaded": len(texts),
        "llm_provider": LLM_PROVIDER,
        "llm_model": LLM_MODEL
    }), 200

# -----------------------------
# Run server
# -----------------------------
if __name__ == "__main__":
    print("Starting Studie RAG API with LLM...")
    texts, sources = load_all_pdfs(PDF_FOLDER)
    bm25 = build_bm25(texts)
    embedder = SentenceTransformer("BAAI/bge-large-en-v1.5")
    print("Initialization complete!")
    
    app.run(host="0.0.0.0", port=5001, debug=False)