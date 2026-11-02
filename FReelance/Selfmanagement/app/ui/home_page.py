from PySide6.QtCore import Qt, Signal
from PySide6.QtWidgets import (
    QFrame, QGridLayout, QHBoxLayout, QLabel, QPushButton, QScrollArea,
    QVBoxLayout, QWidget,
)

from app.database import active_bookings, stats
from app.theme import (
    MUTED, PRIMARY, STAGE_COLORS, TEXT, chip_qss,
)
from app.utils import clear_layout, fmt_dt, load_thumb


class InventoryCard(QFrame):
    clicked = Signal(int)

    def __init__(self, booking):
        super().__init__()
        self.setObjectName("invCard")
        self.bid = booking["id"]
        self.setCursor(Qt.CursorShape.PointingHandCursor)
        layout = QVBoxLayout(self)
        layout.setContentsMargins(12, 12, 12, 12)
        layout.setSpacing(8)

        thumb = QLabel()
        thumb.setFixedSize(150, 150)
        thumb.setPixmap(load_thumb(booking.get("product_image"), 150, 150,
                                   booking.get("product_name")))
        thumb.setAlignment(Qt.AlignmentFlag.AlignCenter)
        thumb.setStyleSheet("background:#0B1222; border-radius:12px;")
        layout.addWidget(thumb, 0, Qt.AlignmentFlag.AlignCenter)

        name = QLabel(booking["product_name"])
        name.setObjectName("sectionTitle")
        name.setWordWrap(True)
        layout.addWidget(name)

        cust = QLabel(f"👤 {booking['customer_name']}")
        cust.setObjectName("mutedText")
        layout.addWidget(cust)

        bottom = QHBoxLayout()
        stage = booking["stage"]
        chip = QLabel(stage)
        chip.setStyleSheet(chip_qss(STAGE_COLORS.get(stage, MUTED)))
        binlbl = QLabel(f"📦 {booking.get('bin_label', '-')}")
        binlbl.setObjectName("mutedText")
        bottom.addWidget(chip)
        bottom.addStretch(1)
        bottom.addWidget(binlbl)
        layout.addLayout(bottom)

        date = QLabel(f"⏱ {fmt_dt(booking['start_date'])}")
        date.setObjectName("mutedText")
        layout.addWidget(date)

    def mousePressEvent(self, event):
        self.clicked.emit(self.bid)
        super().mousePressEvent(event)


class HomePage(QWidget):
    def __init__(self, mw):
        super().__init__()
        self.mw = mw
        self._build()

    def _build(self):
        root = QVBoxLayout(self)
        root.setContentsMargins(28, 24, 28, 24)
        root.setSpacing(20)

        header = QHBoxLayout()
        left = QVBoxLayout()
        left.setSpacing(2)
        self.welcome = QLabel()
        self.welcome.setObjectName("welcomeTitle")
        self.sub = QLabel("Manage repairs, bins and customer jobs.")
        self.sub.setObjectName("mutedText")
        left.addWidget(self.welcome)
        left.addWidget(self.sub)
        header.addLayout(left, 1)

        book = QPushButton("＋ New Booking")
        book.setProperty("variant", "primary")
        book.setCursor(Qt.CursorShape.PointingHandCursor)
        book.setFixedHeight(46)
        book.clicked.connect(self.mw.new_booking)
        header.addWidget(book, 0, Qt.AlignmentFlag.AlignBottom)
        root.addLayout(header)

        self.stats_row = QHBoxLayout()
        self.stats_row.setSpacing(14)
        root.addLayout(self.stats_row)

        inv_title = QLabel("Current Inventory")
        inv_title.setObjectName("sectionTitle")
        root.addWidget(inv_title)

        self.scroll_area = QScrollArea()
        self.scroll_area.setWidgetResizable(True)
        self.scroll_area.setHorizontalScrollBarPolicy(Qt.ScrollBarPolicy.ScrollBarAlwaysOff)
        self.body = QWidget()
        self.body.setObjectName("scrollBody")
        self.grid = QGridLayout(self.body)
        self.grid.setContentsMargins(0, 0, 0, 0)
        self.grid.setSpacing(14)
        self.scroll_area.setWidget(self.body)
        root.addWidget(self.scroll_area, 1)

    def refresh(self):
        from datetime import datetime
        self.welcome.setText("Welcome back 👋")
        self.sub.setText(
            datetime.now().strftime("%A, %d %B %Y") + "  ·  Paramathman Services"
        )
        self._build_stats()
        self._build_grid()

    def _build_stats(self):
        from app.utils import clear_layout
        clear_layout(self.stats_row)
        s = stats()
        cards = [
            ("Received", s["stages"]["Received"], STAGE_COLORS["Received"]),
            ("Not Fixed", s["stages"]["Not Fixed"], STAGE_COLORS["Not Fixed"]),
            ("Fixing", s["stages"]["Fixing"], STAGE_COLORS["Fixing"]),
            ("Finished", s["stages"]["Finished"], STAGE_COLORS["Finished"]),
            ("Free Bins", s["free"], PRIMARY),
        ]
        for title, count, color in cards:
            card = QFrame()
            card.setObjectName("statCard")
            card.setFixedSize(216, 92)
            lay = QHBoxLayout(card)
            lay.setContentsMargins(16, 0, 16, 0)
            lay.setSpacing(12)
            dot = QLabel()
            dot.setFixedSize(12, 12)
            dot.setStyleSheet(f"background:{color}; border-radius:6px;")
            col = QVBoxLayout()
            col.setSpacing(2)
            c = QLabel(str(count))
            c.setStyleSheet(f"color:{TEXT}; font-size:24px; font-weight:800;")
            t = QLabel(title)
            t.setObjectName("mutedText")
            col.addWidget(c)
            col.addWidget(t)
            lay.addWidget(dot)
            lay.addLayout(col)
            self.stats_row.addWidget(card)
        self.stats_row.addStretch(1)

    def _build_grid(self):
        from app.utils import clear_layout
        clear_layout(self.grid)
        bookings = active_bookings()
        if not bookings:
            empty = QLabel("No items on the shelves yet. Start a new booking.")
            empty.setObjectName("mutedText")
            empty.setAlignment(Qt.AlignmentFlag.AlignCenter)
            self.grid.addWidget(empty, 0, 0, 1, 4)
            return
        cols = 4
        for i, b in enumerate(bookings):
            card = InventoryCard(b)
            card.clicked.connect(self.mw.show_product)
            self.grid.addWidget(card, i // cols, i % cols)
