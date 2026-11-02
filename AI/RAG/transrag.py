from flask import Flask, request, jsonify
from flask_cors import CORS  # <--- ADD THIS IMPORT
import fitz  # PyMuPDF
from rank_bm25 import BM25Okapi
from sentence_transformers import SentenceTransformer, util
import glob
import os
from typing import List, Tuple

# -----------------------------
# CONFIGURATION
# -----------------------------
PDF_FOLDER = r"./Dataset"  # <--- PUT ALL YOUR PDFs IN THIS FOLDER
TOP_K_BM25 = 10  # how many results BM25 returns

# -----------------------------
# Initialize Flask app
# -----------------------------
app = Flask(__name__)
CORS(app)  # <--- ENABLE CORS FOR ALL ROUTES

# Global variables for loaded data
texts = []
sources = []
bm25 = None
embedder = None

# -----------------------------
# STEP 1: Extract text from all PDFs
# -----------------------------
def load_all_pdfs(pdf_folder: str) -> Tuple[List[str], List[str]]:
    texts, sources = [], []
    pdf_files = glob.glob(os.path.join(pdf_folder, "*.pdf"))
    if not pdf_files:
        raise FileNotFoundError(f"No PDFs found in {pdf_folder}")
    
    for pdf_path in pdf_files:
        doc = fitz.open(pdf_path)
        for i, page in enumerate(doc):
            text = page.get_text("text").strip()
            if text:
                texts.append(text)
                sources.append(f"{os.path.basename(pdf_path)} - page {i+1}")
        doc.close()
    
    print(f"Loaded {len(texts)} text chunks from {len(pdf_files)} PDFs.")
    return texts, sources

# -----------------------------
# STEP 2: Build BM25 keyword index
# -----------------------------
def build_bm25(texts: List[str]) -> BM25Okapi:
    tokenized = [t.split() for t in texts]
    bm25 = BM25Okapi(tokenized)
    print("BM25 index ready.")
    return bm25

# -----------------------------
# STEP 3: Retrieval + semantic re-ranking
# -----------------------------
def retrieve(query: str, bm25: BM25Okapi, texts: List[str], 
             sources: List[str], embedder: SentenceTransformer, 
             top_k: int) -> List[Tuple[str, str, float]]:
    # Get top BM25 results
    bm25_hits = bm25.get_top_n(query.split(), texts, n=TOP_K_BM25)
    hit_sources = [sources[texts.index(h)] for h in bm25_hits]
    
    # Semantic re-ranking
    query_emb = embedder.encode([query])
    result_embs = embedder.encode(bm25_hits)
    scores = util.cos_sim(query_emb, result_embs)[0]
    
    # Sort by semantic similarity
    ranked = sorted(zip(bm25_hits, hit_sources, scores), 
                   key=lambda x: x[2], reverse=True)
    
    return ranked[:top_k]

# -----------------------------
# STEP 4: Generate answer from contexts
# -----------------------------
def generate_answer(query: str, contexts: List[str]) -> str:
    """
    Simple answer generation. Replace this with your LLM call if needed.
    For now, returns a basic response with context snippets.
    """
    if not contexts:
        return "No relevant information found in the documents."
    
    # Basic answer: you can replace this with OpenAI/Anthropic API call
    answer = f"Based on the provided documents, here are the most relevant sections for '{query}':\n\n"
    for i, ctx in enumerate(contexts, 1):
        snippet = ctx[:300] + "..." if len(ctx) > 300 else ctx
        answer += f"{i}. {snippet}\n\n"
    
    return answer.strip()

# -----------------------------
# STEP 5: Initialize system on startup
# -----------------------------
@app.before_request
def initialize():
    global texts, sources, bm25, embedder
    
    # Only initialize once
    if bm25 is None:
        print("Initializing RAG system...")
        texts, sources = load_all_pdfs(PDF_FOLDER)
        bm25 = build_bm25(texts)
        embedder = SentenceTransformer("BAAI/bge-large-en-v1.5")
        print("RAG system ready!")

# -----------------------------
# API ENDPOINT
# -----------------------------
@app.route('/query', methods=['POST', 'OPTIONS'])  # <--- ADD OPTIONS METHOD
def query_documents():
    # Handle preflight request
    if request.method == 'OPTIONS':
        return '', 200
    
    try:
        # Parse request
        data = request.get_json()
        
        # Validate required fields
        if not data:
            return jsonify({"error": "Request body must be JSON"}), 400
        
        if "query" not in data:
            return jsonify({"error": "Missing required field: query"}), 400
        
        if "top_k" not in data:
            return jsonify({"error": "Missing required field: top_k"}), 400
        
        query = data["query"]
        top_k = data["top_k"]
        
        # Validate types
        if not isinstance(query, str):
            return jsonify({"error": "query must be a string"}), 400
        
        if not isinstance(top_k, int):
            return jsonify({"error": "top_k must be an integer"}), 400
        
        if top_k <= 0:
            return jsonify({"error": "top_k must be greater than 0"}), 400
        
        if not query.strip():
            return jsonify({"error": "query cannot be empty"}), 400
        
        # Retrieve relevant contexts
        results = retrieve(query, bm25, texts, sources, embedder, top_k)
        
        # Extract contexts
        contexts = [r[0] for r in results]
        
        # Generate answer (you can replace this with LLM call)
        answer = generate_answer(query, contexts)
        
        # Return response
        return jsonify({
            "answer": answer,
            "contexts": contexts
        }), 200
        
    except Exception as e:
        print(f"Error processing request: {str(e)}")
        return jsonify({"error": f"Internal server error: {str(e)}"}), 500

# -----------------------------
# Health check endpoint
# -----------------------------
@app.route('/health', methods=['GET'])
def health_check():
    return jsonify({"status": "healthy", "documents_loaded": len(texts)}), 200

# -----------------------------
# Run the server
# -----------------------------
if __name__ == "__main__":
    # Initialize on startup
    print("Starting PDF RAG API...")
    texts, sources = load_all_pdfs(PDF_FOLDER)
    bm25 = build_bm25(texts)
    embedder = SentenceTransformer("all-MiniLM-L6-v2")
    print("Initialization complete!")
    
    # Run Flask app
    app.run(host="0.0.0.0", port=5000, debug=False)