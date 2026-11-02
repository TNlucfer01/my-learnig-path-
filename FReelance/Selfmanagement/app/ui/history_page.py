from PySide6.QtCore import Qt
from PySide6.QtWidgets import (
    QAbstractItemView, QFrame, QHBoxLayout, QHeaderView, QLabel, QLineEdit,
    QScrollArea, QTableWidget, QTableWidgetItem, QVBoxLayout, QWidget,
)

from app.database import history
from app.theme import MUTED, PRIMARY, TEXT, chip_qss
from app.utils import clear_layout, fmt_dt, fmt_dt_short


class HistoryPage(QWidget):
    def __init__(self, mw):
        super().__init__()
        self.mw = mw
        self._build()

    def _build(self):
        root = QVBoxLayout(self)
        root.setContentsMargins(28, 24, 28, 24)
        root.setSpacing(16)

        head = QVBoxLayout()
        head.setSpacing(2)
        title = QLabel("History")
        title.setObjectName("welcomeTitle")
        sub = QLabel("Completed jobs · last 2 months")
        sub.setObjectName("pageDesc")
        head.addWidget(title)
        head.addWidget(sub)
        root.addLayout(head)

        search_row = QHBoxLayout()
        self.search = QLineEdit()
        self.search.setPlaceholderText("Search customer, product, contact or fault…")
        self.search.textChanged.connect(self.refresh)
        search_row.addWidget(self.search)
        root.addLayout(search_row)

        self.table = QTableWidget()
        self.table.setColumnCount(8)
        self.table.setHorizontalHeaderLabels(
            ["Product", "Customer", "Contact", "Fault",
             "Bin", "In", "Out", "Days"])
        self.table.verticalHeader().setVisible(False)
        self.table.setEditTriggers(QAbstractItemView.EditTrigger.NoEditTriggers)
        self.table.setSelectionBehavior(QAbstractItemView.SelectionBehavior.SelectRows)
        self.table.setAlternatingRowColors(True)
        self.table.setSelectionMode(QAbstractItemView.SelectionMode.SingleSelection)
        self.table.doubleClicked.connect(self._open_row)
        self.table.horizontalHeader().setSectionResizeMode(
            QHeaderView.ResizeMode.Stretch)
        root.addWidget(self.table, 1)

    def refresh(self):
        rows = history(days=60, search=self.search.text().strip())
        self.row_ids = {}
        self.table.setRowCount(len(rows))
        for r, b in enumerate(rows):
            self.row_ids[r] = b["id"]
            out = b["end_date"]
            days = "-"
            if out:
                try:
                    from datetime import datetime
                    d1 = datetime.fromisoformat(b["start_date"])
                    d2 = datetime.fromisoformat(out)
                    days = str((d2 - d1).days)
                except ValueError:
                    days = "-"
            vals = [
                b["product_name"], b["customer_name"], b.get("contact") or "-",
                b.get("fault") or "-", b.get("bin_label") or "-",
                fmt_dt_short(b["start_date"]), fmt_dt_short(out),
                days,
            ]
            for c, v in enumerate(vals):
                self.table.setItem(r, c, QTableWidgetItem(v))
        if not rows:
            self.table.setRowCount(1)
            self.table.setItem(0, 0, QTableWidgetItem("No completed jobs in the last 2 months."))

    def _open_row(self, index):
        row = index.row()
        bid = self.row_ids.get(row)
        if bid is not None:
            self.mw.show_product(bid)
