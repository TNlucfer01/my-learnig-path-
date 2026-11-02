BG = "#0F172A"
SURFACE = "#1E293B"
SURFACE_2 = "#334155"
DEEP = "#0B1222"
BORDER = "#2E3D54"
PRIMARY = "#2563EB"
PRIMARY_HOVER = "#1D4ED8"
ACCENT = "#06B6D4"
TEXT = "#FFFFFF"
MUTED = "#94A3B8"
DANGER = "#EF4444"

FREE = "#FFFFFF"
OCCUPIED = "#EF4444"
FINISHED = "#22C55E"

STAGES = ["Received", "Not Fixed", "Fixing", "Finished"]

STAGE_COLORS = {
    "Received": "#F59E0B",
    "Not Fixed": "#EF4444",
    "Fixing": "#06B6D4",
    "Finished": "#22C55E",
}


def rgba(hex_color, alpha):
    c = hex_color.lstrip("#")
    r, g, b = int(c[0:2], 16), int(c[2:4], 16), int(c[4:6], 16)
    return f"rgba({r}, {g}, {b}, {alpha})"


def chip_qss(color):
    return (
        f"background:{rgba(color, 0.16)}; color:{color};"
        "border-radius:9px; padding:2px 10px; font-size:10px; font-weight:700;"
    )


def build_qss():
    return f"""
* {{
    font-family: 'Inter', 'Segoe UI', 'Noto Sans', sans-serif;
    outline: none;
}}
QMainWindow, QDialog {{
    background: {BG};
}}
QWidget {{
    background: transparent;
    color: {TEXT};
    font-size: 13px;
}}
QLabel {{ background: transparent; }}

QFrame#topBar {{
    background: {SURFACE};
    border-bottom: 1px solid {BORDER};
}}
QLabel#logoBadge {{
    background: {PRIMARY};
    color: white;
    font-size: 17px;
    font-weight: 800;
    border-radius: 12px;
}}
QLabel#brandName {{
    font-size: 15px;
    font-weight: 700;
    color: {TEXT};
}}
QLabel#brandSub {{
    font-size: 10px;
    color: {MUTED};
}}

QPushButton[variant="nav"] {{
    background: transparent;
    color: {MUTED};
    border: none;
    border-radius: 9px;
    padding: 8px 18px;
    font-weight: 600;
    font-size: 13px;
}}
QPushButton[variant="nav"]:hover {{
    background: {rgba("#FFFFFF", 0.06)};
    color: {TEXT};
}}

QPushButton[variant="primary"] {{
    background: {PRIMARY};
    color: white;
    border: none;
    border-radius: 10px;
    padding: 11px 24px;
    font-weight: 700;
    font-size: 13px;
}}
QPushButton[variant="primary"]:hover {{ background: {PRIMARY_HOVER}; }}
QPushButton[variant="primary"]:disabled {{
    background: {SURFACE_2};
    color: {MUTED};
}}

QPushButton[variant="accent"] {{
    background: {ACCENT};
    color: #04202A;
    border: none;
    border-radius: 10px;
    padding: 11px 24px;
    font-weight: 700;
}}
QPushButton[variant="accent"]:hover {{ background: #0891B2; }}

QPushButton[variant="ghost"] {{
    background: transparent;
    color: {TEXT};
    border: 1px solid {BORDER};
    border-radius: 10px;
    padding: 10px 20px;
    font-weight: 600;
}}
QPushButton[variant="ghost"]:hover {{ background: {SURFACE_2}; }}

QPushButton[variant="danger"] {{
    background: transparent;
    color: {DANGER};
    border: 1px solid {rgba(DANGER, 0.5)};
    border-radius: 10px;
    padding: 10px 20px;
    font-weight: 600;
}}
QPushButton[variant="danger"]:hover {{ background: {rgba(DANGER, 0.12)}; }}

QLineEdit, QTextEdit, QComboBox {{
    background: {DEEP};
    border: 1px solid {BORDER};
    border-radius: 9px;
    padding: 9px 12px;
    color: {TEXT};
    font-size: 13px;
    selection-background-color: {PRIMARY};
}}
QLineEdit:focus, QTextEdit:focus, QComboBox:focus {{
    border: 1px solid {PRIMARY};
}}
QLineEdit:disabled, QTextEdit:disabled, QComboBox:disabled {{
    color: {MUTED};
    border: 1px solid {BORDER};
    background: transparent;
}}
QTextEdit {{ min-height: 60px; }}
QComboBox::drop-down {{ border: none; width: 28px; }}
QComboBox QAbstractItemView {{
    background: {SURFACE};
    border: 1px solid {BORDER};
    selection-background-color: {PRIMARY};
    selection-color: white;
    outline: none;
}}

QLabel#fieldLabel {{
    color: {MUTED};
    font-size: 11px;
    font-weight: 700;
}}

QFrame#card, QFrame#statCard, QFrame#invCard, QFrame#panel {{
    background: {SURFACE};
    border: 1px solid {BORDER};
    border-radius: 14px;
}}
QFrame#invCard:hover {{
    border: 1px solid {PRIMARY};
}}

QLabel#welcomeTitle {{
    font-size: 26px;
    font-weight: 800;
    color: {TEXT};
}}
QLabel#sectionTitle {{
    font-size: 15px;
    font-weight: 700;
    color: {TEXT};
}}
QLabel#mutedText {{
    color: {MUTED};
    font-size: 12px;
}}
QLabel#pageDesc {{
    color: {MUTED};
    font-size: 12px;
}}

QScrollArea {{
    background: transparent;
    border: none;
}}
QWidget#scrollBody {{ background: transparent; }}

QTableWidget {{
    background: {SURFACE};
    alternate-background-color: #1B2740;
    border: 1px solid {BORDER};
    border-radius: 12px;
    gridline-color: {BORDER};
    selection-background-color: {rgba(PRIMARY, 0.35)};
    selection-color: {TEXT};
}}
QHeaderView::section {{
    background: {DEEP};
    color: {MUTED};
    font-weight: 700;
    font-size: 11px;
    padding: 10px 8px;
    border: none;
    border-right: 1px solid {BORDER};
    border-bottom: 1px solid {BORDER};
}}

QScrollBar:vertical {{
    background: transparent;
    width: 9px;
    margin: 0;
}}
QScrollBar::handle:vertical {{
    background: {SURFACE_2};
    border-radius: 4px;
    min-height: 30px;
}}
QScrollBar::add-line:vertical, QScrollBar::sub-line:vertical {{ height: 0; }}
QScrollBar::add-page:vertical, QScrollBar::sub-page:vertical {{ background: none; }}
QScrollBar:horizontal {{
    background: transparent;
    height: 9px;
    margin: 0;
}}
QScrollBar::handle:horizontal {{
    background: {SURFACE_2};
    border-radius: 4px;
    min-width: 30px;
}}
QScrollBar::add-line:horizontal, QScrollBar::sub-line:horizontal {{ width: 0; }}
QScrollBar::add-page:horizontal, QScrollBar::sub-page:horizontal {{ background: none; }}

QMessageBox {{
    background: {SURFACE};
}}
QMessageBox QLabel {{ color: {TEXT}; font-size: 13px; }}
"""
