# Paramathman Services — Self Management

A desktop **self-management app** for *Paramathman Services* built with **Python + PySide6 (Qt for Python)**. It tracks repair/service jobs from intake to completion, manages a dynamic shelf of bins, and keeps a 2‑month history of finished work — all backed by a local SQLite database.

This is a **C++/Qt-style application written in Python** (PySide6 is the official Qt binding for Python), so no external server or database installation is required.

---

## Features

| Area | What it does |
|------|--------------|
| **Home** | Welcome banner, big *New Booking* button, live stat cards (Received / Not Fixed / Fixing / Finished / Free Bins), and an inventory grid of everything currently on the shelves. |
| **Booking wizard** | 3-step flow: **Customer details** (name, contact, photo) → **Product details** (name, fault, image) → **Pick a free bin** → finish. Start date is stamped automatically ("getting"). |
| **Bins / Shelves** | Color-coded shelf grid — **white = free**, **red = occupied**, **green = work finished**. Add shelves dynamically with *＋ Add Shelf*. |
| **Bin details** | Click any bin to see the current occupant (photo + customer details) **and** the full history of that bin. |
| **Product page** | Image on top, **edit icon** (top-right) to unlock fields + change photos, **Save** (bottom-right), plus *Mark Picked Up* and *Delete*. |
| **Stages** | `Received` (start date) → `Not Fixed` → `Fixing` → `Finished` (end date auto-set). |
| **History** | All completed jobs from the **last 2 months**, searchable by customer / product / contact / fault. |
| **Theme** | Uses your brand colors: `#0F172A`, `#2563EB`, `#06B6D4`, `#FFFFFF`. |

---

## Requirements

- **Python** 3.9 or newer (developed on 3.13)
- **PySide6** 6.6 or newer (Qt 6)
- A desktop OS with a display (Windows / macOS / Linux)

No network connection, accounts, or external database are needed.

---

## Installation

Clone or download this repository, then install dependencies:

```bash
pip install -r requirements.txt
```

> If you use a virtual environment:
> ```bash
> python -m venv .venv
> source .venv/bin/activate      # Windows: .venv\Scripts\activate
> pip install -r requirements.txt
> ```

---

## Running the app

From the project root:

```bash
python main.py
```

On first launch the app:

1. Creates the local database at `data/paramathman.db`
2. Seeds **2 shelves × 10 bins** (20 bins total) — you can add more any time via *＋ Add Shelf*
3. Opens the **Home** screen

To run a quick offline/headless sanity check (e.g. on a server without a display):

```bash
QT_QPA_PLATFORM=offscreen python main.py
```

---

## How to use

### 1. New booking (intake)
- Click **＋ New Booking** on the Home screen.
- **Step 1 – Customer**: enter name, contact, and (optionally) choose a customer photo.
- **Step 2 – Product**: enter product name, fault/issue, and (optionally) a product image.
- **Step 3 – Bin**: pick any **white (free)** bin. If none are free, click **＋ Add Shelf**.
- Press **Create Booking ✓**. The job is placed and its start date is recorded.

### 2. Track progress
- Open the **Bins** tab. Occupied bins are red, finished jobs are green.
- Click a bin to view the customer and the bin's history.
- Open a job (from Home grid, Bins dialog, or History) and change its **Stage** via the *Edit* button → *Save*. Setting stage to **Finished** auto-stamps the end date.

### 3. Finish & collect
- When a job is done, set its stage to **Finished** (bin turns green).
- Use **Mark Picked Up** to release the bin back to *free* while keeping the record in History.

### 4. History
- The **History** tab lists all completed jobs from the last 2 months.
- Type in the search box to filter by customer, product, contact, or fault.
- Double-click a row to reopen the job.

---

## Project structure

```
.
├── main.py                  # Entry point — builds QApplication + MainWindow
├── requirements.txt         # Python dependencies
├── app/
│   ├── database.py          # SQLite layer: shelves, slots, bookings, stats
│   ├── theme.py             # Brand colors + global QSS stylesheet
│   ├── utils.py             # Date formatting, image thumbnails, layout helpers
│   └── ui/
│       ├── main_window.py   # Top bar, nav, page stack
│       ├── home_page.py     # Welcome, stats, inventory grid
│       ├── booking_wizard.py# 3-step new-booking flow
│       ├── bins_page.py     # Color-coded shelf grid + add shelf
│       ├── bin_dialog.py    # Bin details + history
│       ├── product_page.py  # Job view/edit (image, Save, collect, delete)
│       └── history_page.py  # 2-month completed jobs + search
└── data/                    # Auto-created: SQLite DB + uploads/ (git-ignored)
```

---

## Data model (SQLite)

| Table | Purpose |
|-------|---------|
| `shelves` | Shelf definitions (name, column count). |
| `slots`   | Individual bins, each with a label like `1-3` (shelf-position). |
| `bookings`| A job: customer name, contact, photos, product, fault, `stage`, `start_date`, `end_date`, linked to one `slot`. An `active` flag frees the bin when picked up while preserving history. |

Uploaded images are copied into `data/uploads/` so the originals can be moved or deleted safely.

---

## Theming

All colors live at the top of `app/theme.py`:

```python
BG = "#0F172A"
PRIMARY = "#2563EB"
ACCENT = "#06B6D4"
TEXT = "#FFFFFF"
```

Bin status colors:

```python
FREE = "#FFFFFF"      # free
OCCUPIED = "#EF4444"  # occupied (red)
FINISHED = "#22C55E"  # work finished (green)
```

Edit these constants and the global `build_qss()` stylesheet to rebrand.

---

## Troubleshooting

- **`ModuleNotFoundError: PySide6`** → run `pip install -r requirements.txt` (use your venv if you created one).
- **Blank/hidden fonts or odd rendering** → make sure you're on Qt 6 (PySide6), not PyQt5.
- **Want to start fresh** → stop the app and delete the `data/` folder; it will be recreated and re-seeded on next launch (this also clears all jobs).
- **Reset only the database, keep uploads** → delete just `data/paramathman.db`.

---

## License

Internal tool for Paramathman Services.
