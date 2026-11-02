from datetime import datetime

from PySide6.QtCore import Qt
from PySide6.QtGui import QColor, QFont, QPainter, QPixmap


def fmt_dt(value):
    if not value:
        return "-"
    try:
        dt = datetime.fromisoformat(value)
        return dt.strftime("%d %b %Y · %H:%M")
    except ValueError:
        return value


def fmt_dt_short(value):
    if not value:
        return "-"
    try:
        dt = datetime.fromisoformat(value)
        return dt.strftime("%d %b %Y")
    except ValueError:
        return value


def placeholder_pixmap(text, size=160, color="#2563EB"):
    pm = QPixmap(size, size)
    pm.fill(QColor("#0B1222"))
    p = QPainter(pm)
    p.setRenderHint(QPainter.RenderHint.Antialiasing)
    p.setPen(QColor("#94A3B8"))
    f = QFont()
    f.setPixelSize(int(size * 0.34))
    f.setBold(True)
    p.setFont(f)
    p.drawText(pm.rect(), Qt.AlignmentFlag.AlignCenter, (text or "?")[:2].upper())
    p.end()
    return pm


def load_thumb(path, w, h, fallback="?"):
    pm = QPixmap(path) if path else QPixmap()
    if pm.isNull():
        return placeholder_pixmap(fallback, min(w, h))
    return pm.scaled(w, h, Qt.AspectRatioMode.KeepAspectRatioByExpanding,
                     Qt.TransformationMode.SmoothTransformation)


def clear_layout(layout):
    while layout.count():
        item = layout.takeAt(0)
        w = item.widget()
        if w is not None:
            w.deleteLater()
        elif item.layout() is not None:
            clear_layout(item.layout())
