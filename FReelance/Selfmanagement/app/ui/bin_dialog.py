from PySide6.QtCore import Qt
from PySide6.QtWidgets import (
    QAbstractItemView, QDialog, QFrame, QHBoxLayout, QHeaderView, QLabel,
    QPushButton, QTableWidget, QTableWidgetItem, QVBoxLayout,
)

from app.database import slot_bookings, get_booking
from app.theme import (
    ACCENT, FINISHED, MUTED, OCCUPIED, PRIMARY, STAGE_COLORS, TEXT, chip_qss,
)
from app.utils import fmt_dt, load_thumb


class BinDialog(QDialog):
    def __init__(self, mw, slot):
        super().__init__(mw)
        self.mw = mw
        self.setWindowTitle(f"Bin {slot['label']}")
        self.setMinimumSize(560, 480)
        layout = QVBoxLayout(self)
        layout.setContentsMargins(20, 20, 20, 20)
        layout.setSpacing(16)

        title = QLabel(f"📦 Bin {slot['label']}")
        title.setObjectName("welcomeTitle")
        layout.addWidget(title)

        current = get_booking(slot["booking_id"]) if slot["status"] != "free" else None

        if slot["status"] == "free":
            empty = QLabel("This bin is currently empty.")
            empty.setObjectName("mutedText")
            empty.setAlignment(Qt.AlignmentFlag.AlignCenter)
            layout.addWidget(empty, 1)
        else:
            card = QFrame()
            card.setObjectName("panel")
            cl = QVBoxLayout(card)
            cl.setContentsMargins(16, 16, 16, 16)
            cl.setSpacing(10)
            head = QHBoxLayout()
            photo = QLabel()
            photo.setFixedSize(64, 64)
            photo.setAlignment(Qt.AlignmentFlag.AlignCenter)
            photo.setStyleSheet("background:#0B1222; border-radius:32px;")
            photo.setPixmap(load_thumb(current.get("photo_path"), 64, 64,
                                       current.get("customer_name")))
            info = QVBoxLayout()
            info.setSpacing(3)
            nm = QLabel(slot["customer"])
            nm.setObjectName("sectionTitle")
            pr = QLabel(slot["product"])
            pr.setObjectName("mutedText")
            st = QLabel(slot["stage"])
            st.setStyleSheet(chip_qss(STAGE_COLORS.get(slot["stage"], MUTED)))
            info.addWidget(nm)
            info.addWidget(pr)
            info.addWidget(st)
            head.addWidget(photo)
            head.addSpacing(12)
            head.addLayout(info)
            head.addStretch(1)
            cl.addLayout(head)
            dates = QLabel(f"📥 In: {fmt_dt(slot['start'])}")
            dates.setObjectName("mutedText")
            cl.addWidget(dates)
            layout.addWidget(card)

        hist_label = QLabel("Bin History")
        hist_label.setObjectName("sectionTitle")
        layout.addWidget(hist_label)

        table = QTableWidget()
        table.setColumnCount(5)
        table.setHorizontalHeaderLabels(
            ["Product", "Customer", "In", "Out", "Status"])
        table.verticalHeader().setVisible(False)
        table.setEditTriggers(QAbstractItemView.EditTrigger.NoEditTriggers)
        table.setSelectionBehavior(QAbstractItemView.SelectionBehavior.SelectRows)
        table.setAlternatingRowColors(True)
        hist = slot_bookings(slot["slot_id"])
        table.setRowCount(len(hist))
        for r, b in enumerate(hist):
            out = fmt_dt(b["end_date"]) if b["end_date"] else "—"
            vals = [b["product_name"], b["customer_name"],
                    fmt_dt(b["start_date"]), out, b["stage"]]
            for c, v in enumerate(vals):
                table.setItem(r, c, QTableWidgetItem(v))
        table.horizontalHeader().setSectionResizeMode(
            QHeaderView.ResizeMode.Stretch)
        layout.addWidget(table, 1)

        footer = QHBoxLayout()
        footer.setSpacing(12)
        if slot["status"] != "free":
            open_btn = QPushButton("Open Job")
            open_btn.setProperty("variant", "primary")
            open_btn.setCursor(Qt.CursorShape.PointingHandCursor)
            open_btn.clicked.connect(self._open_job)
            footer.addWidget(open_btn)
        close_btn = QPushButton("Close")
        close_btn.setProperty("variant", "ghost")
        close_btn.setCursor(Qt.CursorShape.PointingHandCursor)
        close_btn.clicked.connect(self.accept)
        footer.addStretch(1)
        footer.addWidget(close_btn)
        layout.addLayout(footer)

        self._current_booking = slot.get("booking_id")

    def _open_job(self):
        if self._current_booking:
            self.accept()
            self.mw.show_product(self._current_booking)
