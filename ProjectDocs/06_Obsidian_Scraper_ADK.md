# 🧠 Obsidian Scraper Agent — Google ADK Multi-Agent System

tags: #project #ai #agents #gemini #adk #multiagent #python #obsidian #automation

---

## 📌 One-Line Summary
> A sophisticated multi-agent AI system built with Google's Agent Development Kit (ADK) that autonomously researches any topic across GeeksforGeeks, Wikipedia, and the general web — then creates formatted, interconnected Obsidian markdown files with wikilinks, diagrams, and quality validation.

---

## 📂 Location
`~/aathi/AI/ADK/ObsidianScrap/`

---

## 🏗️ System Architecture

```
User Input: Topic
        │
        ▼
┌──────────────────────────────────────────────┐
│              ROOT AGENT                       │
│  (Gemini 2.5 Flash — Orchestrator)           │
│  Validates topic → delegates to MainWorkflow  │
└──────────────────┬───────────────────────────┘
                   │
                   ▼
┌──────────────────────────────────────────────┐
│            PARALLEL SCRAPING                  │
│  ┌──────────────┐ ┌─────────────┐ ┌────────┐ │
│  │ GFGScraper  │ │WikiScraper  │ │WebScr. │ │
│  │ (GFG only)  │ │(Wikipedia)  │ │(Other) │ │
│  └──────────────┘ └─────────────┘ └────────┘ │
│    ParallelAgent — all 3 run simultaneously   │
└──────────────────┬───────────────────────────┘
                   │ gfg_data + wiki_data + web_data
                   ▼
┌──────────────────────────────────────────────┐
│       CONTENT PROCESSING PIPELINE             │
│  (SequentialAgent)                            │
│                                               │
│  1. ContentMergerAgent                        │
│     → Deduplicates + cross-references sources │
│     → Identifies subtopics and themes         │
│                                               │
│  2. MarkdownWriterAgent                       │
│     → Creates one .md file per subtopic       │
│     → Adds code examples, key points          │
│                                               │
│  3. ObsidianFormatterAgent                    │
│     → YAML frontmatter, [[wikilinks]]         │
│     → Mermaid diagrams, callouts, ToC         │
│     → Creates _Index.md with link graph       │
└──────────────────┬───────────────────────────┘
                   │ formatted_files
                   ▼
┌──────────────────────────────────────────────┐
│         VALIDATION LOOP (LoopAgent)           │
│                                               │
│  QualityValidatorAgent checks each file:      │
│  ✓ Max 300 lines per file                     │
│  ✓ Valid markdown syntax                      │
│  ✓ [[wikilinks]] are valid                    │
│  ✓ Code blocks have syntax highlighting       │
│  ✓ YAML frontmatter complete                  │
│  ✓ No duplicate content                       │
│  ✓ Proper heading hierarchy                   │
│  ✓ Mermaid diagrams valid                     │
│                                               │
│  Loop exits when: validator returns "APPROVED" │
└──────────────────┬───────────────────────────┘
                   │ approved_files
                   ▼
┌──────────────────────────────────────────────┐
│        OBSIDIAN FILE WRITER AGENT             │
│  → Reads OBSIDIAN_VAULT_PATH from .env        │
│  → Creates subdirectory with topic name       │
│  → Writes all .md files with UTF-8 encoding  │
│  → Logs all file operations                   │
└──────────────────────────────────────────────┘
        Output: Files saved to Obsidian vault
```

---

## 🛠️ Technology Stack

| Component | Technology |
|-----------|-----------|
| Language | Python |
| AI Framework | Google ADK (Agent Development Kit) |
| LLM | Gemini 2.0 Flash Experimental |
| Agent Types | `Agent`, `SequentialAgent`, `ParallelAgent`, `LoopAgent` |
| Search Tool | `google_search` (ADK built-in) |
| Runner | `InMemoryRunner` |
| Config | `.env` (OBSIDIAN_VAULT_PATH, GOOGLE_API_KEY) |
| Output Format | Obsidian-compatible Markdown |

---

## ✅ Key Features

### 🤖 Multi-Agent Design Patterns Used

| Pattern | Agent | Purpose |
|---------|-------|---------|
| **ParallelAgent** | `ParallelScraperAgent` | Run 3 scrapers simultaneously |
| **SequentialAgent** | `ContentProcessingPipeline` | Process in order: merge → write → format |
| **LoopAgent** | `RefinementLoopAgent` | Iterate until quality validation passes |
| **Root Agent** | `RootAgent` | Orchestrate the entire workflow |

### 🔍 Three Specialized Scrapers
1. **GFGScraperAgent** — Targets `site:geeksforgeeks.org`, extracts article content + code examples
2. **WikipediaScraperAgent** — Finds Wikipedia page, extracts intro, sections, ToC, references
3. **GeneralWebScraperAgent** — Searches `.edu`, `.org`, Medium, Dev.to, GitHub, FreeCodeCamp

### 📝 Obsidian Output Format
Each generated `.md` file contains:
- YAML frontmatter (title, date, tags, sources)
- Table of Contents
- Key Concepts section
- Detailed Explanation with proper formatting
- Code Examples with syntax highlighting
- `[[wikilinks]]` to related subtopics
- Mermaid diagrams (flowcharts for processes, graphs for relationships)
- Callouts (`> [!note]`) for important points
- Reference links with source URLs

### 🔄 Self-Validating Loop
- Validator checks 10 criteria per file
- If any file fails → provides specific feedback → loop continues
- Only exits when ALL files pass ALL criteria
- Prevents broken markdown, invalid links, poor structure

### ⚙️ Retry Configuration
```python
retry_config = types.HttpRetryOptions(
    attempts=5,
    exp_base=7,
    initial_delay=1,
    http_status_codes=[429, 500, 503, 504]  # Rate limit + server errors
)
```

---

## 📁 File Structure

```
AI/ADK/ObsidianScrap/
├── agent.py          ← Complete multi-agent system (524 lines, 14KB)
├── gemini.md         ← Project documentation
├── requirement.txt   ← google-adk, python-dotenv
├── .env              ← OBSIDIAN_VAULT_PATH + GOOGLE_API_KEY
├── __init__.py       ← Module init
└── venv/             ← Python virtual environment
```

---

## 🔧 How to Run

```bash
cd AI/ADK/ObsidianScrap
pip install -r requirement.txt

# Set up .env
echo "OBSIDIAN_VAULT_PATH=/path/to/vault" >> .env
echo "GOOGLE_API_KEY=your_key" >> .env

# Run
python agent.py
# → Enter a topic (e.g., "Binary Search Trees")
# → Agent system researches, creates, validates, and saves .md files
```

---

## 💡 Resume Bullet Points

- Designed and implemented a **production-grade multi-agent AI system** using Google's **ADK (Agent Development Kit)** with `Gemini 2.0 Flash` as the backbone model
- Engineered a **parallel scraping layer** (`ParallelAgent`) that simultaneously extracts content from GeeksforGeeks, Wikipedia, and general web sources using `google_search`
- Built a **sequential content processing pipeline** (`SequentialAgent`): content merging → Markdown writing → Obsidian formatting with YAML frontmatter, `[[wikilinks]]`, and Mermaid diagrams
- Implemented a **self-validating refinement loop** (`LoopAgent`) that iterates until all generated files pass 10 quality criteria (structure, syntax, cross-references, heading hierarchy)
- Applied **exponential backoff retry logic** for API rate limit resilience (HTTP 429/500/503/504)

---

## 🏷️ Tags
`#googleADK` `#multiagent` `#gemini` `#parallelagent` `#sequentialagent` `#loopagent` `#obsidian` `#automation` `#python`

---

## 🔗 Links
- [[00_INDEX]]
- [[RAG Chatbot (Wikipedia)]]
- [[RAG Chatbot (Medical - TransRAG)]]
