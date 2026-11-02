from PySide6.QtCore import Qt
from PySide6.QtWidgets import (
    QFrame, QGridLayout, QHBoxLayout, QLabel, QPushButton, QScrollArea,
    QVBoxLayout, QWidget,
)

from app.database import add_shelf, slot_rows
from app.theme import (
    FINISHED, MUTED, OCCUPIED, PRIMARY, SURFACE_2, TEXT, chip_qss,
)
from app.ui.bin_dialog import BinDialog
from app.utils import clear_layout, fmt_dt


class SlotButton(QPushButton):
    def __init__(self, slot):
        super().__init__()
        self.slot = slot
        self.setFixedSize(96, 96)
        self.setCursor(Qt.CursorShape.PointingHandCursor)
        self._style()

    def _style(self, selected=False):
        status = self.slot["status"]
        if status == "free":
            bg, fg, label = "#FFFFFF", "#0F172A", "FREE"
        elif status == "finished":
            bg, fg, label = FINISHED, "#04240F", "DONE"
        else:
            bg, fg, label = OCCUPIED, "#FFFFFF", "USED"
        if selected:
            border = f"border:3px solid {PRIMARY};"
            bg = SURFACE_2 if status != "free" else "#E2E8F0"
        else:
            border = f"border:1px solid {SURFACE_2};"
        self.setStyleSheet(
            f"background:{bg}; color:{fg}; border-radius:12px; {border} "
            "font-weight:700;")
        self.setText(f"{self.slot['label']}\n{label}")


class BinsPage(QWidget):
    def __init__(self, mw):
        super().__init__()
        self.mw = mw
        self._build()

    def _build(self):
        root = QVBoxLayout(self)
        root.setContentsMargins(28, 24, 28, 24)
        root.setSpacing(16)

        head = QHBoxLayout()
        title = QLabel("Bins / Shelves")
        title.setObjectName("welcomeTitle")
        sub = QLabel("White = free · Red = occupied · Green = work finished")
        sub.setObjectName("pageDesc")
        left = QVBoxLayout()
        left.setSpacing(2)
        left.addWidget(title)
        left.addWidget(sub)
        head.addLayout(left, 1)

        add_btn = QPushButton("＋ Add Shelf")
        add_btn.setProperty("variant", "ghost")
        add_btn.setCursor(Qt.CursorShape.PointingHandCursor)
        add_btn.clicked.connect(self._add_shelf)
        head.addWidget(add_btn)
        root.addLayout(head)

        self.scroll_area = QScrollArea()
        self.scroll_area.setWidgetResizable(True)
        self.body = QWidget()
        self.body.setObjectName("scrollBody")
        self.vlay = QVBoxLayout(self.body)
        self.vlay.setContentsMargins(0, 0, 0, 0)
        self.vlay.setSpacing(22)
        self.scroll_area.setWidget(self.body)
        root.addWidget(self.scroll_area, 1)

    def refresh(self):
        clear_layout(self.vlay)
        shelves = slot_rows()
        for shelf in shelves:
            section = QVBoxLayout()
            section.setSpacing(10)
            label = QLabel(f"🗄 {shelf['name']}  ·  {len(shelf['slots'])} bins")
            label.setObjectName("sectionTitle")
            section.addWidget(label)
            grid = QGridLayout()
            grid.setSpacing(12)
            cols = 10
            for i, slot in enumerate(shelf["slots"]):
                btn = SlotButton(slot)
                btn.clicked.connect(lambda _, s=slot: self._open_bin(s))
                grid.addWidget(btn, i // cols, i % cols)
            section.addLayout(grid)
            self.vlay.addLayout(section)
        self.vlay.addStretch(1)

    def _open_bin(self, slot):
        dlg = BinDialog(self.mw, slot)
        dlg.exec()

    def _add_shelf(self):
        add_shelf()
        self.refresh()
