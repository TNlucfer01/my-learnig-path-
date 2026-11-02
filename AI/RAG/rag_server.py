import os
import time
from typing import List, Optional, Dict
from concurrent.futures import ThreadPoolExecutor, as_completed, ProcessPoolExecutor
from fastapi import FastAPI, HTTPException
from fastapi.responses import JSONResponse
from pydantic import BaseModel
import uvicorn
from pathlib import Path
import logging
import fitz  # PyMuPDF
from PIL import Image
from io import BytesIO
import gc
from functools import partial
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.vectorstores import Chroma
from langchain_ollama import OllamaEmbeddings, OllamaLLM
from langchain.chains import RetrievalQA
from langchain.prompts import PromptTemplate
from langchain.docstore.document import Document
import multiprocessing as mp

logging.basicConfig(level=logging.WARNING)
logger = logging.getLogger(__name__)

app = FastAPI(title="Ultra-Fast Medical RAG", version="4.0.0")

# Globals
vectorstore = None
qa_chain = None
image_store = {}

# Optimized Configuration
EMBEDDING_MODEL = "mxbai-embed-large"
LLM_MODEL = "llama3.2:3b"
CHUNK_SIZE = 600  # Smaller = faster
CHUNK_OVERLAP = 100
COLLECTION_NAME = "medical_docs"
PERSIST_DIRECTORY = "./chroma_db"
PDF_DIRECTORY = "./Dataset"
IMAGE_DIRECTORY = "./images"
MAX_IMAGE_SIZE = (512, 512)  # Smaller images
BATCH_SIZE = 100  # Larger batches
MAX_WORKERS = min(mp.cpu_count(), 8)  # Use all CPUs

os.makedirs(PERSIST_DIRECTORY, exist_ok=True)
os.makedirs(IMAGE_DIRECTORY, exist_ok=True)

# Initialize once
embeddings = OllamaEmbeddings(model=EMBEDDING_MODEL)
llm = OllamaLLM(model=LLM_MODEL, temperature=0.2, num_ctx=2048)

prompt_template = """Context: {context}
Question: {question}
Answer:"""
PROMPT = PromptTemplate(template=prompt_template, input_variables=["context", "question"])

class QueryRequest(BaseModel):
    question: str
    top_k: Optional[int] = 3  # Fewer docs = faster

class QueryResponse(BaseModel):
    answer: str
    sources: List[dict]

class IndexRequest(BaseModel):
    pdf_directory: Optional[str] = None
    extract_images: Optional[bool] = False  # Default off for speed

def extract_images_fast(page, pdf_name: str, page_num: int) -> List[Dict]:
    """Fast image extraction - only essentials."""
    images = []
    try:
        for idx, img_info in enumerate(page.get_images(full=True)[:5]):  # Max 5 images/page
            try:
                xref = img_info[0]
                base_image = page.parent.extract_image(xref)
                img = Image.open(BytesIO(base_image["image"]))
                img.thumbnail(MAX_IMAGE_SIZE, Image.Resampling.NEAREST)  # Fastest resize
                
                filename = f"{pdf_name}_p{page_num}_{idx}.jpg"
                filepath = os.path.join(IMAGE_DIRECTORY, filename)
                img.convert('RGB').save(filepath, "JPEG", quality=70, optimize=False)
                
                images.append({"file": filename, "page": page_num, "source": pdf_name})
            except:
                continue
    except:
        pass
    return images

def process_pdf_ultra_fast(pdf_path: str, extract_images: bool) -> tuple:
    """Process PDF at maximum speed."""
    docs = []
    imgs = []
    
    try:
        pdf = fitz.open(pdf_path)
        pdf_name = Path(pdf_path).stem
        
        for page_num in range(len(pdf)):
            page = pdf[page_num]
            text = page.get_text()
            
            if len(text.strip()) < 50:  # Skip nearly empty pages
                continue
            
            if extract_images:
                imgs.extend(extract_images_fast(page, pdf_name, page_num + 1))
            
            docs.append(Document(
                page_content=text,
                metadata={"source": pdf_name, "page": page_num + 1}
            ))
        
        pdf.close()
    except Exception as e:
        logger.error(f"Error: {pdf_path}: {e}")
    
    return docs, imgs

def chunk_documents_fast(documents: List[Document]) -> List[Document]:
    """Ultra-fast chunking."""
    splitter = RecursiveCharacterTextSplitter(
        chunk_size=CHUNK_SIZE,
        chunk_overlap=CHUNK_OVERLAP,
        separators=["\n\n", "\n", ". ", " "],
        length_function=len
    )
    return splitter.split_documents(documents)

def load_pdfs_parallel(directory: str, extract_images: bool = False):
    """Parallel PDF processing with ProcessPoolExecutor."""
    pdf_files = list(Path(directory).glob("*.pdf"))
    
    if not pdf_files:
        raise FileNotFoundError(f"No PDFs in {directory}")
    
    logger.warning(f"Processing {len(pdf_files)} PDFs with {MAX_WORKERS} workers...")
    
    all_docs = []
    all_imgs = []
    
    # Use ProcessPoolExecutor for true parallelism
    with ProcessPoolExecutor(max_workers=MAX_WORKERS) as executor:
        process_func = partial(process_pdf_ultra_fast, extract_images=extract_images)
        futures = {executor.submit(process_func, str(f)): f for f in pdf_files}
        
        for i, future in enumerate(as_completed(futures), 1):
            try:
                docs, imgs = future.result()
                all_docs.extend(docs)
                all_imgs.extend(imgs)
                print(f"[{i}/{len(pdf_files)}] ✓ {futures[future].name}: {len(docs)} pages")
            except Exception as e:
                print(f"[{i}/{len(pdf_files)}] ✗ Error: {e}")
    
    return all_docs, all_imgs

def create_vectorstore_fast(documents: List[Document]):
    """Fast vectorstore creation with large batches."""
    global vectorstore
    
    print(f"\nIndexing {len(documents)} chunks in batches of {BATCH_SIZE}...")
    total = (len(documents) + BATCH_SIZE - 1) // BATCH_SIZE
    
    for i in range(0, len(documents), BATCH_SIZE):
        batch = documents[i:i + BATCH_SIZE]
        batch_num = i // BATCH_SIZE + 1
        
        try:
            if vectorstore is None:
                vectorstore = Chroma.from_documents(
                    documents=batch,
                    embedding=embeddings,
                    collection_name=COLLECTION_NAME,
                    persist_directory=PERSIST_DIRECTORY
                )
            else:
                vectorstore.add_documents(batch)
            
            print(f"  [{batch_num}/{total}] ✓")
        except Exception as e:
            print(f"  [{batch_num}/{total}] ✗ {e}")
    
    gc.collect()

@app.get("/")
async def root():
    return {
        "name": "Ultra-Fast Medical RAG",
        "endpoints": {
            "/index": "POST - Index PDFs (fast mode)",
            "/query": "POST - Query system",
            "/health": "GET - Status",
            "/reset": "POST - Reset"
        }
    }

@app.get("/health")
async def health():
    count = 0
    if vectorstore:
        try:
            count = vectorstore._collection.count()
        except:
            count = "unknown"
    
    return {
        "status": "ready" if qa_chain else "not_indexed",
        "chunks": count,
        "images": len(image_store)
    }

@app.post("/index")
async def index(request: IndexRequest):
    global vectorstore, qa_chain, image_store
    
    pdf_dir = request.pdf_directory or PDF_DIRECTORY
    extract_imgs = request.extract_images or False
    
    try:
        start = time.time()
        
        # Step 1: Load PDFs in parallel
        print(f"\n{'='*60}")
        print("STEP 1: Loading PDFs...")
        docs, imgs = load_pdfs_parallel(pdf_dir, extract_imgs)
        
        if not docs:
            raise HTTPException(400, "No documents loaded")
        
        for img in imgs:
            image_store[f"{img['source']}_p{img['page']}"] = img
        
        # Step 2: Chunk
        print(f"\nSTEP 2: Chunking {len(docs)} pages...")
        chunks = chunk_documents_fast(docs)
        print(f"  ✓ Created {len(chunks)} chunks")
        
        # Step 3: Vectorize
        print(f"\nSTEP 3: Creating embeddings...")
        create_vectorstore_fast(chunks)
        
        # Step 4: QA Chain
        print(f"\nSTEP 4: Building QA chain...")
        qa_chain = RetrievalQA.from_chain_type(
            llm=llm,
            chain_type="stuff",
            retriever=vectorstore.as_retriever(search_kwargs={"k": 3}),
            chain_type_kwargs={"prompt": PROMPT},
            return_source_documents=True
        )
        
        elapsed = time.time() - start
        print(f"\n{'='*60}")
        print(f"✓ COMPLETE in {elapsed:.1f}s")
        print(f"{'='*60}\n")
        
        return {
            "status": "success",
            "pages": len(docs),
            "chunks": len(chunks),
            "images": len(imgs),
            "time_seconds": round(elapsed, 1)
        }
        
    except Exception as e:
        raise HTTPException(500, str(e))

@app.post("/query", response_model=QueryResponse)
async def query(request: QueryRequest):
    global qa_chain
    
    if not qa_chain:
        raise HTTPException(400, "Not indexed. Run /index first")
    
    try:
        # Update retriever
        qa_chain.retriever.search_kwargs = {"k": request.top_k or 3}
        
        # Query
        result = qa_chain({"query": request.question})
        
        # Format sources
        sources = []
        for doc in result.get("source_documents", []):
            sources.append({
                "text": doc.page_content[:300] + "...",
                "source": doc.metadata.get("source", "unknown"),
                "page": doc.metadata.get("page", "unknown")
            })
        
        return QueryResponse(
            answer=result["result"],
            sources=sources
        )
        
    except Exception as e:
        raise HTTPException(500, str(e))

@app.post("/reset")
async def reset():
    global vectorstore, qa_chain, image_store
    vectorstore = None
    qa_chain = None
    image_store = {}
    return {"status": "reset"}

@app.on_event("startup")
async def startup():
    global vectorstore, qa_chain
    
    if os.path.exists(PERSIST_DIRECTORY):
        print("\nLoading existing database...")
        try:
            vectorstore = Chroma(
                persist_directory=PERSIST_DIRECTORY,
                embedding_function=embeddings,
                collection_name=COLLECTION_NAME
            )
            
            count = vectorstore._collection.count()
            print(f"✓ Loaded {count} chunks")
            
            qa_chain = RetrievalQA.from_chain_type(
                llm=llm,
                chain_type="stuff",
                retriever=vectorstore.as_retriever(search_kwargs={"k": 3}),
                chain_type_kwargs={"prompt": PROMPT},
                return_source_documents=True
            )
            print("✓ System ready\n")
        except Exception as e:
            print(f"✗ Could not load: {e}\n")

if __name__ == "__main__":
    print("\n" + "="*60)
    print("ULTRA-FAST MEDICAL RAG SYSTEM")
    print("="*60)
    print(f"Workers: {MAX_WORKERS}")
    print(f"Batch Size: {BATCH_SIZE}")
    print(f"Models: {EMBEDDING_MODEL}, {LLM_MODEL}")
    print("="*60 + "\n")
    
    uvicorn.run(app, host="0.0.0.0", port=8000, log_level="warning")
