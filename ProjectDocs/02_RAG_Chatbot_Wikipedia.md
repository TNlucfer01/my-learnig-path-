# 🤖 RAG Chatbot — Wikipedia Knowledge Base

tags: #project #ai #rag #langchain #ollama #chroma #nlp #streamlit #python

---

## 📌 One-Line Summary
> A fully local Retrieval-Augmented Generation (RAG) chatbot that scrapes Wikipedia, chunks and embeds the content into a vector store, and answers user questions — zero external API needed.

---

## 📂 Location
`~/aathi/RAG/`

---

## 🏗️ Architecture & Pipeline

```
Step 1: Data Ingestion
  Wikipedia Scraping (Bright Data API)
           │
           ▼
  1_scraping_wikipedia.py
  → Scrapes Wikipedia articles for a topic
  → Saves raw text

           │
           ▼
Step 2: Chunking, Embedding & Ingestion
  2_chunking_embedding_ingestion.py
  → Splits text into overlapping chunks
  → Embeds using mxbai-embed-large (via Ollama)
  → Stores in Chroma vector database

           │
           ▼
Step 3: Chatbot Interface
  3_chatbot.py (Streamlit)
  → User query → Semantic search in Chroma
  → Top-k chunks retrieved
  → Sent to Ollama LLM as context
  → LLM generates grounded answer
  → Displayed in Streamlit chat UI
```

---

## 🛠️ Technology Stack

| Component | Technology |
|-----------|-----------|
| Language | Python 3.11+ |
| Web Scraping | Bright Data API (Wikipedia) |
| Text Chunking | LangChain `RecursiveCharacterTextSplitter` |
| Embeddings | `mxbai-embed-large` via Ollama |
| Vector Store | Chroma DB |
| LLM Runtime | Ollama (local) |
| LLM Models | qwen3, llama3.2, or any Ollama model |
| UI Framework | Streamlit |
| Orchestration | LangChain |

---

## ✅ Key Features

- **3-step pipeline:** Scrape → Embed → Chat
- **Fully offline after setup:** No external API calls during chat
- **Semantic search:** Vector similarity retrieval (not keyword matching)
- **Wikipedia as knowledge source:** Reliable, structured content
- **Flexible LLM:** Any Ollama-compatible model works
- **Example scripts included:** `example_chunking.py`, `example_embedding.py`, `example_retriever.py` for isolated testing
- **Keywords spreadsheet** (`keywords.xlsx`) for topic management

---

## 📁 File Structure

```
RAG/
├── 1_scraping_wikipedia.py        ← Wikipedia scraper (Bright Data API)
├── 2_chunking_embedding_ingestion.py ← Chunk + embed + store in Chroma
├── 3_chatbot.py                   ← Streamlit chatbot interface
├── example_chunking.py            ← Chunking demo
├── example_embedding.py           ← Embedding demo
├── example_retriever.py           ← Retrieval demo
├── keywords.xlsx                  ← Topic keywords list
├── requirements.txt               ← Dependencies
└── readme.md
```

---

## 🔧 How to Run

```bash
python -m venv venv && source venv/bin/activate
pip install -r requirements.txt

# Step 1: Scrape Wikipedia
python 1_scraping_wikipedia.py

# Step 2: Embed and store
python 2_chunking_embedding_ingestion.py

# Step 3: Launch chatbot
streamlit run 3_chatbot.py
```

---

## 💡 Resume Bullet Points

- Built a fully local **Retrieval-Augmented Generation (RAG)** pipeline using **LangChain**, **Chroma** vector store, and **Ollama** — no cloud API dependency
- Implemented 3-stage pipeline: Wikipedia scraping → semantic chunking + embedding (`mxbai-embed-large`) → LLM-grounded Q&A via **Streamlit**
- Applied **vector similarity search** over embedded knowledge chunks for precise, context-grounded answers

---

## 🏷️ Tags
`#rag` `#langchain` `#chroma` `#ollama` `#mxbai` `#vectorstore` `#streamlit` `#nlp` `#python`

---

## 🔗 Links
- [[00_INDEX]]
- [[RAG Chatbot (Medical - TransRAG)]]
- [[Obsidian Scraper Agent (ADK)]]
