# Vir — Campus AI Assistant · Project Brief

---

## 1. Project Name

**Vir** — Intelligent AI Campus Assistant for P.T. Lee Chengalvaraya Naicker College of Engineering and Technology (PT Lee CNCET)

---

## 2. One-Line Description

A multi-modal RAG-powered campus AI assistant that answers natural-language questions about academic records, regulations, and campus navigation using a hybrid SQL + vector-search + agentic reasoning architecture.

---

## 3. Tech Stack

| Layer | Technology |
|---|---|
| **LLM / Inference** | Groq API (`openai/gpt-oss-20b`, configurable via `.env`) |
| **Embeddings** | Jina AI (`jina-embeddings-v3`, 1024-dim, task-aware: `retrieval.passage` / `retrieval.query`) |
| **Vector Store** | Qdrant (cloud primary + local file fallback at `./data/qdrant_db`) |
| **Structured DB** | SQLite (`app.db`) auto-built from CSV/XLSX ingestion |
| **Backend Framework** | FastAPI (Python 3.x) with CORS middleware |
| **Frontend** | React 18 + TypeScript + Vite + Tailwind CSS + Framer Motion |
| **UI Icons** | Lucide React |
| **PDF Parsing** | PyPDF / pdfplumber (via `ingest_pdfs.py`) |
| **CSV/Excel Ingest** | pandas (via `ingest_excel.py`, `ingest_sqlite.py`) |
| **Text Splitting** | LangChain `RecursiveCharacterTextSplitter` (chunk_size=500, overlap=100) |
| **Retry / Resilience** | `tenacity` (exponential backoff, min=2s, max=20s, 4 attempts on Groq calls) |
| **Config** | `python-dotenv` |
| **Speech** | Web Speech API (via `speechService.ts` in the React frontend) |
| **Navigation Algorithm** | Graph-based BFS / shortest-path for indoor campus routing |

---

## 4. Key Features — What Was Built

**1. Multi-Round Agentic Reasoning Loop**
A tool-calling agent (`MAX_ROUNDS = 6`) built on Groq's function-calling API orchestrates 5 registered tools: `vector_search`, `sql_query`, `find_path`, `list_rooms`, and `get_room_info`. The agent iterates, accumulating tool results into its message context, and either self-terminates when confident or forces a synthesis pass after exhausting rounds.

**2. 3-Layer Hybrid Query Router**
Every incoming question is classified into `COMPUTE` (SQL), `LOOKUP` (vector), or `HYBRID` via three cascading layers:
- Layer 1: Regex force-patterns for registration numbers and student/faculty name patterns
- Layer 2: Weighted keyword scoring (`_COMPUTE_KEYWORDS` vs `_LOOKUP_KEYWORDS`)
- Layer 3: LLM fallback — a zero-temperature Groq call with `max_tokens=10` returning a single word

**3. Natural-Language-to-SQL with 5-Iteration Self-Correction**
The SQL engine translates user questions to SQLite via LLM, executes against `app.db`, and on failure feeds the broken SQL + error message back to the LLM for automatic correction — up to 5 retries. Security is enforced via a 3-layer guard: first-token check (`SELECT`/`WITH` only), full-string destructive-keyword regex (blocks CTE-wrapped `DELETE`/`DROP` bypass tricks), and `PRAGMA query_only = ON` at the SQLite connection level.

**4. Task-Asymmetric Jina Embeddings + Qdrant Retrieval with Re-ranking**
Documents are embedded with the `retrieval.passage` task type; queries use `retrieval.query` — exploiting Jina v3's asymmetric embedding space for improved retrieval accuracy. Retrieved chunks are de-duplicated, then re-ranked by a length-weighted entity keyword score before being assembled into a 6,000-character context budget.

**5. Graph-Based Indoor Campus Navigation**
The college floor plan (Ground, First, Second floors) is encoded as a weighted node-edge graph. `find_path(source, destination)` runs shortest-path search resolving partial room name strings to node IDs, then returns turn-by-turn directions with floor-change instructions and corridor distance in discrete units. Three tools cover navigation: pathfinding, room search by keyword/category/floor, and individual room detail lookup.

**6. Multi-Source Data Ingestion Pipeline**
`ingest_sqlite.py` and `ingest_excel.py` bulk-load real student mark sheets (IAT, Model Exam, University exams), semester attendance CSVs, and faculty telephone directory XLSXs from 4 academic batches (2022–2027) across 7 departments (CSE, IT, ECE, EEE, Mech, Civil, AI&DS) into a unified `app.db` SQLite database with pre-built aggregate views: `view_student_performance_summary`, `view_exam_subject_analytics`, `view_student_complete_profile`.

---

## 5. Measurable Metrics

| Metric | Value |
|---|---|
| Python source files | 40+ `.py` modules |
| Python lines of code | ~3,500+ lines |
| React/TypeScript components | 15 frontend components |
| TypeScript/TSX lines | ~1,000+ lines |
| Agent reasoning rounds (max) | 6 rounds per query |
| SQL self-correction retries (max) | 5 attempts per query |
| Embedding dimensions | 1,024 (Jina v3) |
| Qdrant batch upsert size | 50 points/batch |
| Context budget per retrieval | 6,000 characters |
| Student data coverage | 4 batches (2022–2027), 7 departments |
| Exam types covered | IAT-1, IAT-2, Model Exam, University Exam |
| Estimated query latency | 3–8s (simple), 8–15s (multi-tool agent) |

---

## 6. Deployment / Platform

- **Backend:** FastAPI (`uvicorn`) running locally; routes registered both at root (`/`) and under `/api/` prefix for reverse-proxy compatibility
- **Frontend:** React SPA served via Vite dev server; production build via `tsc && vite build`
- **Vector DB:** Qdrant Cloud (primary); automatic fallback to local persistent storage (`./data/qdrant_db`) on connection failure
- **Structured DB:** SQLite file (`app.db`) — auto-generated on first run via `ingest_sqlite.py`
- **Platform:** Web application (desktop browser); speech input via Web Speech API

---

## 7. Notable Technical Challenges & Design Decisions

**Dual-source routing ambiguity**
Disambiguating "who is X" (→ SQL) from "what is X" (→ vector) was the hardest classification problem. Solved with a layered classifier that avoids unnecessary LLM calls on obvious cases — the regex fast-lane handles reg numbers and name-pattern queries with zero tokens spent.

**Read-only SQL safety at depth**
A naive first-token check is bypassable via CTEs (`WITH t AS (DELETE ...) SELECT ...`). The implementation adds a full-string regex scan for all destructive keywords before execution, combined with `PRAGMA query_only = ON` at the SQLite connection level as a third line of defence.

**Task-asymmetric embeddings as a deliberate choice**
Jina v3's separate task types for documents (`retrieval.passage`) and queries (`retrieval.query`) are not interchangeable — the embedding space is optimised differently. This is used deliberately, not by accident, to improve retrieval precision over symmetric embedding approaches.

**Graph-based indoor navigation vs lookup table**
Rather than a static room-to-room lookup table, the campus map is encoded as a proper weighted graph. This enables multi-hop pathfinding across stairwells and floors, handles partial name resolution, and scales cleanly as new rooms are added.

**Two parallel architectures coexist**
The codebase maintains a legacy direct RAG pipeline (router → retriever → prompt builder → LLM) alongside the newer agentic loop. The agent subsumes both paths, but the simpler pipeline remains viable for lightweight, document-specific queries without the overhead of multi-round function calling.

---

## 8. Project Status

**In Progress**

Core systems are functionally complete:
- Agentic reasoning loop ✅
- Hybrid query router ✅
- NL→SQL engine with self-correction ✅
- Vector search + re-ranking ✅
- Campus navigation graph ✅
- Data ingestion pipeline ✅
- React frontend UI (all 15 components) ✅

Known open items:
- CSV upload support in the file upload route is stubbed but not fully wired (noted in `config.py` comment)
- `followups.py` has a missing `return` statement (questions generated but not returned)
- No production deployment configuration (no Dockerfile, no cloud config)
- No `.env.example` committed to guide setup
