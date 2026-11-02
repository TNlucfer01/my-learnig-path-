# 🏥 TransRAG — Medical RAG Chatbot (Full-Stack)

tags: #project #ai #rag #langchain #ollama #chroma #fastapi #react #python #fullstack

---

## 📌 One-Line Summary
> A full-stack medical Retrieval-Augmented Generation chatbot with a FastAPI backend and React frontend — scrapes medical content, indexes it offline, and answers healthcare questions with source-grounded responses.

---

## 📂 Location
`~/aathi/AI/RAG/`

---

## 🏗️ Architecture

```
                ┌──────────────────────────────────┐
                │         React Frontend            │
                │  (Frontend/ directory)            │
                │  Chat UI + Message history        │
                └────────────┬─────────────────────┘
                             │ HTTP REST
                             ▼
                ┌──────────────────────────────────┐
                │       FastAPI Backend             │
                │       rag_server.py               │
                │  /query endpoint                  │
                │  Retrieval + LLM call             │
                └──────┬───────────────────┬────────┘
                       │                   │
              ┌────────▼──────┐   ┌────────▼───────┐
              │  Chroma DB    │   │  Ollama LLM    │
              │ (Vector Store)│   │ (Local Model)  │
              └───────────────┘   └────────────────┘

              Separate scripts:
              transrag.py      ← Core RAG logic
              TRANSRAGLLM.py  ← Extended LLM integration
              fs.py           ← File system utilities
```

---

## 🛠️ Technology Stack

| Layer | Technology | Notes |
|-------|-----------|-------|
| Backend | FastAPI (Python) | REST API serving the RAG pipeline |
| Frontend | React | Chat UI (`Frontend/` directory) |
| RAG Orchestration | LangChain | Chain construction, retrieval |
| Embeddings | mxbai-embed-large (Ollama) | Local embedding model |
| Vector Store | Chroma DB | Persistent local vector store |
| LLM | Ollama | Fully local — no cloud dependency |
| Data Source | Medical content corpus | Healthcare Q&A knowledge base |

---

## ✅ Key Features

### 🔌 Full-Stack Architecture
- **FastAPI backend** (`rag_server.py`, 11.4KB) exposes a `/query` REST endpoint
- **React frontend** provides a clean chat interface
- Both run locally — completely offline capable

### 🧠 RAG Pipeline
- **`transrag.py`** (6.5KB) — Core RAG logic: load documents, chunk, embed, retrieve, generate
- **`TRANSRAGLLM.py`** (10.9KB) — Extended version with additional LLM integrations
- **`fs.py`** (6.7KB) — File system utilities for document management

### 📊 Performance
- Healthcare Q&A accuracy: ~55% (baseline)
- Improvements applied via:
  - **Retrieval optimization** (chunk overlap, top-k tuning)
  - **Prompt engineering** (structured prompts for medical context)

### ⚡ Additional Scripts
- `example_chunking.py`, `example_embedding.py`, `example_retriever.py` — isolated testing components
- `hello.html` — minimal test interface

---

## 📁 File Structure

```
AI/RAG/
├── rag_server.py              ← FastAPI backend (main entry point, 11.4KB)
├── transrag.py                ← Core RAG implementation (6.5KB)
├── TRANSRAGLLM.py             ← Extended RAG + LLM integration (10.9KB)
├── fs.py                      ← File system utilities (6.7KB)
├── example_chunking.py        ← Chunking examples
├── example_embedding.py       ← Embedding demo
├── example_retriever.py       ← Retrieval demo
├── hello.html                 ← Minimal test UI
├── keywords.xlsx              ← Medical topic keywords
├── requirements.txt           ← Python dependencies
├── Frontend/                  ← React chat frontend
└── readme.md
```

---

## 🔧 How to Run

```bash
# Backend
pip install -r requirements.txt
ollama pull mxbai-embed-large
ollama serve
uvicorn rag_server:app --reload

# Frontend (in another terminal)
cd Frontend
npm install && npm run dev
```

---

## 💡 Resume Bullet Points

- Architected a **full-stack medical RAG chatbot** with **FastAPI** (Python) backend and **React** frontend, serving healthcare Q&A via REST API
- Built complete **LangChain RAG pipeline**: document ingestion → chunking → embedding (`mxbai-embed-large`) → **Chroma** vector store → **Ollama** LLM response
- Improved retrieval accuracy through **chunk overlap tuning** and structured **prompt engineering** for medical domain
- Entire system operates **fully offline** — no cloud services or API keys required during inference

---

## 🏷️ Tags
`#rag` `#fastapi` `#react` `#langchain` `#chroma` `#ollama` `#medical` `#fullstack` `#python`

---

## 🔗 Links
- [[00_INDEX]]
- [[RAG Chatbot (Wikipedia)]]
- [[Plant Guard]]
- [[Obsidian Scraper Agent (ADK)]]
