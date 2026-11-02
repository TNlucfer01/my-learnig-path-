import shutil
import sqlite3
from datetime import datetime, timedelta
from pathlib import Path
from uuid import uuid4

BASE_DIR = Path(__file__).resolve().parent.parent
DATA_DIR = BASE_DIR / "data"
UPLOAD_DIR = DATA_DIR / "uploads"
DB_PATH = DATA_DIR / "paramathman.db"

SLOTS_PER_SHELF = 10
DEFAULT_SHELVES = 2


def _conn():
    conn = sqlite3.connect(str(DB_PATH))
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys=ON")
    return conn


def init_db():
    DATA_DIR.mkdir(parents=True, exist_ok=True)
    UPLOAD_DIR.mkdir(parents=True, exist_ok=True)
    conn = _conn()
    conn.executescript(
        """
        CREATE TABLE IF NOT EXISTS shelves (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            cols INTEGER NOT NULL DEFAULT 10,
            created_at TEXT DEFAULT (datetime('now','localtime'))
        );
        CREATE TABLE IF NOT EXISTS slots (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            shelf_id INTEGER NOT NULL REFERENCES shelves(id) ON DELETE CASCADE,
            position INTEGER NOT NULL,
            label TEXT NOT NULL UNIQUE
        );
        CREATE TABLE IF NOT EXISTS bookings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            customer_name TEXT NOT NULL,
            contact TEXT DEFAULT '',
            photo_path TEXT DEFAULT '',
            product_name TEXT NOT NULL,
            fault TEXT DEFAULT '',
            product_image TEXT DEFAULT '',
            notes TEXT DEFAULT '',
            stage TEXT NOT NULL DEFAULT 'Received',
            slot_id INTEGER REFERENCES slots(id),
            active INTEGER NOT NULL DEFAULT 1,
            start_date TEXT NOT NULL,
            end_date TEXT DEFAULT ''
        );
        """
    )
    conn.commit()
    count = conn.execute("SELECT COUNT(*) AS c FROM shelves").fetchone()["c"]
    if count == 0:
        for i in range(1, DEFAULT_SHELVES + 1):
            add_shelf(f"Shelf {i}")
    conn.close()


def _copy_upload(src):
    if not src:
        return ""
    ext = Path(src).suffix.lower()
    dest = UPLOAD_DIR / f"{uuid4().hex}{ext}"
    shutil.copy2(src, dest)
    return str(dest)


def add_shelf(name=None, cols=SLOTS_PER_SHELF):
    conn = _conn()
    seq = conn.execute("SELECT COUNT(*) AS c FROM shelves").fetchone()["c"] + 1
    if name is None:
        name = f"Shelf {seq}"
    cur = conn.execute("INSERT INTO shelves (name, cols) VALUES (?, ?)", (name, cols))
    shelf_id = cur.lastrowid
    rows = []
    for pos in range(1, cols + 1):
        label = f"{seq}-{pos}"
        cur2 = conn.execute(
            "INSERT INTO slots (shelf_id, position, label) VALUES (?, ?, ?)",
            (shelf_id, pos, label),
        )
        rows.append(cur2.lastrowid)
    conn.commit()
    conn.close()
    return shelf_id


def slot_rows():
    conn = _conn()
    rows = conn.execute(
        """
        SELECT sh.id AS shelf_id, sh.name AS shelf_name,
               s.id AS slot_id, s.position, s.label,
               b.id AS booking_id, b.stage, b.customer_name,
               b.product_name, b.start_date, b.end_date
        FROM shelves sh
        JOIN slots s ON s.shelf_id = sh.id
        LEFT JOIN bookings b ON b.slot_id = s.id AND b.active = 1
        ORDER BY sh.id, s.position
        """
    ).fetchall()
    conn.close()
    shelves = {}
    for r in rows:
        sh = r["shelf_id"]
        if sh not in shelves:
            shelves[sh] = {"id": sh, "name": r["shelf_name"], "slots": []}
        if r["booking_id"] is None:
            status = "free"
        elif r["stage"] == "Finished":
            status = "finished"
        else:
            status = "occupied"
        shelves[sh]["slots"].append({
            "slot_id": r["slot_id"],
            "position": r["position"],
            "label": r["label"],
            "status": status,
            "booking_id": r["booking_id"],
            "stage": r["stage"],
            "customer": r["customer_name"],
            "product": r["product_name"],
            "start": r["start_date"],
            "end": r["end_date"],
        })
    return [shelves[k] for k in sorted(shelves)]


def free_slots():
    conn = _conn()
    rows = conn.execute(
        """
        SELECT s.id, s.label
        FROM slots s
        LEFT JOIN bookings b ON b.slot_id = s.id AND b.active = 1
        WHERE b.id IS NULL
        ORDER BY s.label
        """
    ).fetchall()
    conn.close()
    return [dict(r) for r in rows]


def create_booking(name, contact, photo, product, fault, image, notes, slot_id):
    conn = _conn()
    now = datetime.now().isoformat()
    photo_path = _copy_upload(photo)
    image_path = _copy_upload(image)
    cur = conn.execute(
        """
        INSERT INTO bookings
        (customer_name, contact, photo_path, product_name, fault,
         product_image, notes, stage, slot_id, active, start_date)
        VALUES (?, ?, ?, ?, ?, ?, ?, 'Received', ?, 1, ?)
        """,
        (name, contact or "", photo_path, product, fault or "",
         image_path, notes or "", slot_id, now),
    )
    bid = cur.lastrowid
    conn.commit()
    conn.close()
    return bid


def get_booking(bid):
    conn = _conn()
    row = conn.execute(
        """
        SELECT b.*, s.label AS bin_label
        FROM bookings b
        LEFT JOIN slots s ON s.id = b.slot_id
        WHERE b.id = ?
        """,
        (bid,),
    ).fetchone()
    conn.close()
    return dict(row) if row else None


def active_bookings():
    conn = _conn()
    rows = conn.execute(
        """
        SELECT b.*, s.label AS bin_label
        FROM bookings b
        LEFT JOIN slots s ON s.id = b.slot_id
        WHERE b.active = 1
        ORDER BY b.start_date DESC
        """
    ).fetchall()
    conn.close()
    return [dict(r) for r in rows]


def update_booking(bid, fields):
    allowed = {
        "customer_name", "contact", "photo_path",
        "product_name", "fault", "product_image", "notes",
    }
    sets = [f"{k} = ?" for k in fields if k in allowed]
    vals = []
    for k in fields:
        if k not in allowed:
            continue
        v = fields[k]
        if k in ("photo_path", "product_image") and v and UPLOAD_DIR not in Path(v).parents:
            v = _copy_upload(v)
        vals.append(v)
    if not sets:
        return
    conn = _conn()
    conn.execute(f"UPDATE bookings SET {', '.join(sets)} WHERE id = ?",
                 (*vals, bid))
    conn.commit()
    conn.close()


def set_stage(bid, stage):
    conn = _conn()
    if stage == "Finished":
        conn.execute(
            """
            UPDATE bookings
            SET stage = ?, end_date = COALESCE(NULLIF(end_date, ''), ?)
            WHERE id = ?
            """,
            (stage, datetime.now().isoformat(), bid),
        )
    else:
        conn.execute(
            "UPDATE bookings SET stage = ?, end_date = '' WHERE id = ?",
            (stage, bid),
        )
    conn.commit()
    conn.close()


def collect_booking(bid):
    conn = _conn()
    conn.execute("UPDATE bookings SET active = 0 WHERE id = ?", (bid,))
    conn.commit()
    conn.close()


def delete_booking(bid):
    conn = _conn()
    conn.execute("DELETE FROM bookings WHERE id = ?", (bid,))
    conn.commit()
    conn.close()


def history(days=60, search=""):
    cutoff = (datetime.now() - timedelta(days=days)).isoformat()
    conn = _conn()
    if search:
        like = f"%{search}%"
        rows = conn.execute(
            """
            SELECT b.*, s.label AS bin_label
            FROM bookings b
            LEFT JOIN slots s ON s.id = b.slot_id
            WHERE b.stage = 'Finished'
              AND COALESCE(NULLIF(b.end_date, ''), b.start_date) >= ?
              AND (b.customer_name LIKE ? OR b.product_name LIKE ?
                   OR b.contact LIKE ? OR b.fault LIKE ?)
            ORDER BY b.end_date DESC
            """,
            (cutoff, like, like, like, like),
        ).fetchall()
    else:
        rows = conn.execute(
            """
            SELECT b.*, s.label AS bin_label
            FROM bookings b
            LEFT JOIN slots s ON s.id = b.slot_id
            WHERE b.stage = 'Finished'
              AND COALESCE(NULLIF(b.end_date, ''), b.start_date) >= ?
            ORDER BY b.end_date DESC
            """,
            (cutoff,),
        ).fetchall()
    conn.close()
    return [dict(r) for r in rows]


def slot_bookings(slot_id):
    conn = _conn()
    rows = conn.execute(
        """
        SELECT b.*, s.label AS bin_label
        FROM bookings b
        LEFT JOIN slots s ON s.id = b.slot_id
        WHERE b.slot_id = ?
        ORDER BY b.start_date DESC
        """,
        (slot_id,),
    ).fetchall()
    conn.close()
    return [dict(r) for r in rows]


def stats():
    conn = _conn()
    per_stage = {s: 0 for s in
                 ["Received", "Not Fixed", "Fixing", "Finished"]}
    for r in conn.execute(
        "SELECT stage, COUNT(*) c FROM bookings WHERE active = 1 GROUP BY stage"
    ).fetchall():
        per_stage[r["stage"]] = r["c"]
    total = conn.execute("SELECT COUNT(*) c FROM slots").fetchone()["c"]
    free = conn.execute(
        """
        SELECT COUNT(*) c FROM slots s
        LEFT JOIN bookings b ON b.slot_id = s.id AND b.active = 1
        WHERE b.id IS NULL
        """
    ).fetchone()["c"]
    conn.close()
    return {"stages": per_stage, "total": total, "free": free}
