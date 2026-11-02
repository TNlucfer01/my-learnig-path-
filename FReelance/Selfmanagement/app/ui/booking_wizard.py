from PySide6.QtCore import Qt
from PySide6.QtWidgets import (
    QFrame, QGridLayout, QHBoxLayout, QLabel, QLineEdit, QPushButton,
    QScrollArea, QStackedLayout, QTextEdit, QVBoxLayout, QWidget,
)

from app.database import add_shelf, create_booking, free_slots
from app.theme import MUTED, PRIMARY, TEXT, chip_qss
from app.utils import load_thumb


class BookingWizard(QWidget):
    def __init__(self, mw):
        super().__init__()
        self.mw = mw
        self.step = 0
        self.photo_path = ""
        self.image_path = ""
        self.selected_slot = None
        self._build()

    def _build(self):
        root = QVBoxLayout(self)
        root.setContentsMargins(0, 0, 0, 0)
        root.setSpacing(0)

        header = QFrame()
        header.setObjectName("topBar")
        header.setFixedHeight(60)
        h = QHBoxLayout(header)
        h.setContentsMargins(20, 0, 20, 0)
        h.setSpacing(12)
        self.title = QLabel("New Booking")
        self.title.setObjectName("sectionTitle")
        h.addWidget(self.title)
        h.addStretch(1)
        self.steps = QLabel()
        self.steps.setObjectName("mutedText")
        h.addWidget(self.steps)
        root.addWidget(header)

        self.area = QScrollArea()
        self.area.setWidgetResizable(True)
        self.body = QWidget()
        self.body.setObjectName("scrollBody")
        self.stack = QStackedLayout(self.body)
        self.stack.setContentsMargins(0, 0, 0, 0)
        self.area.setWidget(self.body)
        root.addWidget(self.area, 1)

        self._build_step1()
        self._build_step2()
        self._build_step3()

        footer = QFrame()
        footer.setObjectName("topBar")
        footer.setFixedHeight(64)
        f = QHBoxLayout(footer)
        f.setContentsMargins(20, 0, 20, 0)
        f.setSpacing(12)
        self.cancel_btn = QPushButton("Cancel")
        self.cancel_btn.setProperty("variant", "ghost")
        self.cancel_btn.setCursor(Qt.CursorShape.PointingHandCursor)
        self.cancel_btn.clicked.connect(lambda: self.mw.show_page("home"))
        self.back_btn = QPushButton("← Back")
        self.back_btn.setProperty("variant", "ghost")
        self.back_btn.setCursor(Qt.CursorShape.PointingHandCursor)
        self.back_btn.clicked.connect(self._back)
        self.next_btn = QPushButton("Next →")
        self.next_btn.setProperty("variant", "primary")
        self.next_btn.setCursor(Qt.CursorShape.PointingHandCursor)
        self.next_btn.clicked.connect(self._next)
        f.addWidget(self.cancel_btn)
        f.addStretch(1)
        f.addWidget(self.back_btn)
        f.addWidget(self.next_btn)
        root.addWidget(footer)

    def _field_box(self, label, widget):
        box = QVBoxLayout()
        box.setSpacing(5)
        lbl = QLabel(label)
        lbl.setObjectName("fieldLabel")
        box.addWidget(lbl)
        box.addWidget(widget)
        wrap = QWidget()
        wrap.setLayout(box)
        return wrap

    def _build_step1(self):
        page = QWidget()
        lay = QVBoxLayout(page)
        lay.setContentsMargins(48, 28, 48, 28)
        lay.setSpacing(16)
        title = QLabel("Customer Details")
        title.setObjectName("welcomeTitle")
        lay.addWidget(title)

        self.c_name = QLineEdit()
        self.c_contact = QLineEdit()
        grid = QGridLayout()
        grid.setSpacing(14)
        grid.addWidget(self._field_box("Customer Name *", self.c_name), 0, 0)
        grid.addWidget(self._field_box("Contact No *", self.c_contact), 0, 1)
        lay.addLayout(grid)

        self.c_photo = QLabel()
        self.c_photo.setFixedSize(110, 110)
        self.c_photo.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.c_photo.setStyleSheet("background:#0B1222; border-radius:12px;")
        self.c_photo.setPixmap(load_thumb("", 110, 110, "Photo"))
        pick = QPushButton("📷 Choose Customer Photo")
        pick.setProperty("variant", "ghost")
        pick.setCursor(Qt.CursorShape.PointingHandCursor)
        pick.clicked.connect(self._pick_customer)
        lay.addWidget(self.c_photo)
        lay.addWidget(pick)
        lay.addStretch(1)
        self.stack.addWidget(page)

    def _build_step2(self):
        page = QWidget()
        lay = QVBoxLayout(page)
        lay.setContentsMargins(48, 28, 48, 28)
        lay.setSpacing(16)
        title = QLabel("Product Details")
        title.setObjectName("welcomeTitle")
        lay.addWidget(title)

        self.p_name = QLineEdit()
        self.p_fault = QTextEdit()
        self.p_fault.setFixedHeight(80)
        grid = QGridLayout()
        grid.setSpacing(14)
        grid.addWidget(self._field_box("Product Name *", self.p_name), 0, 0)
        grid.addWidget(self._field_box("Fault / Issue", self.p_fault), 0, 1)
        lay.addLayout(grid)

        self.p_image = QLabel()
        self.p_image.setFixedSize(150, 150)
        self.p_image.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.p_image.setStyleSheet("background:#0B1222; border-radius:12px;")
        self.p_image.setPixmap(load_thumb("", 150, 150, "Image"))
        pick = QPushButton("📷 Choose Product Image")
        pick.setProperty("variant", "ghost")
        pick.setCursor(Qt.CursorShape.PointingHandCursor)
        pick.clicked.connect(self._pick_product)
        lay.addWidget(self.p_image)
        lay.addWidget(pick)
        lay.addStretch(1)
        self.stack.addWidget(page)

    def _build_step3(self):
        page = QWidget()
        lay = QVBoxLayout(page)
        lay.setContentsMargins(48, 28, 48, 28)
        lay.setSpacing(16)
        title = QLabel("Select Free Bin")
        title.setObjectName("welcomeTitle")
        lay.addWidget(title)
        self.slot_info = QLabel()
        self.slot_info.setObjectName("mutedText")
        lay.addWidget(self.slot_info)

        self.slot_scroll = QScrollArea()
        self.slot_scroll.setWidgetResizable(True)
        self.slot_body = QWidget()
        self.slot_grid = QGridLayout(self.slot_body)
        self.slot_grid.setSpacing(12)
        self.slot_scroll.setWidget(self.slot_body)
        lay.addWidget(self.slot_scroll, 1)

        add = QPushButton("＋ Add Shelf")
        add.setProperty("variant", "ghost")
        add.setCursor(Qt.CursorShape.PointingHandCursor)
        add.clicked.connect(self._add_shelf_refresh)
        lay.addWidget(add)
        self.stack.addWidget(page)

    def _pick_customer(self):
        from PySide6.QtWidgets import QFileDialog
        path, _ = QFileDialog.getOpenFileName(
            self, "Customer photo", "",
            "Images (*.png *.jpg *.jpeg *.bmp *.webp)")
        if path:
            self.photo_path = path
            self.c_photo.setPixmap(load_thumb(path, 110, 110, "Photo"))

    def _pick_product(self):
        from PySide6.QtWidgets import QFileDialog
        path, _ = QFileDialog.getOpenFileName(
            self, "Product image", "",
            "Images (*.png *.jpg *.jpeg *.bmp *.webp)")
        if path:
            self.image_path = path
            self.p_image.setPixmap(load_thumb(path, 150, 150, "Image"))

    def _refresh_slots(self):
        from app.utils import clear_layout
        clear_layout(self.slot_grid)
        self.slot_buttons = {}
        slots = free_slots()
        self.slot_info.setText(
            f"{len(slots)} free bins available across the shelves.")
        if not slots:
            note = QLabel("No free bins. Add a shelf to continue.")
            note.setObjectName("mutedText")
            self.slot_grid.addWidget(note, 0, 0)
            return
        cols = 10
        for i, s in enumerate(slots):
            btn = QPushButton(s["label"])
            btn.setProperty("variant", "ghost")
            btn.setFixedSize(84, 84)
            btn.setCursor(Qt.CursorShape.PointingHandCursor)
            btn.clicked.connect(lambda _, sid=s["id"], b=btn: self._select_slot(sid, b))
            self.slot_buttons[s["id"]] = btn
            self.slot_grid.addWidget(btn, i // cols, i % cols)

    def _select_slot(self, sid, btn):
        self.selected_slot = sid
        for b in self.slot_buttons.values():
            b.setStyleSheet("")
        btn.setStyleSheet(
            f"background:{PRIMARY}; color:#fff; border:1px solid {PRIMARY};"
            "border-radius:10px; font-weight:700;")

    def _add_shelf_refresh(self):
        add_shelf()
        self._refresh_slots()

    def reset(self):
        self.step = 0
        self.photo_path = ""
        self.image_path = ""
        self.selected_slot = None
        self.c_name.clear()
        self.c_contact.clear()
        self.p_name.clear()
        self.p_fault.clear()
        self.c_photo.setPixmap(load_thumb("", 110, 110, "Photo"))
        self.p_image.setPixmap(load_thumb("", 150, 150, "Image"))
        self._show_step(0)

    def _show_step(self, idx):
        self.step = idx
        self.stack.setCurrentIndex(idx)
        self.steps.setText(f"Step {idx + 1} of 3")
        self.back_btn.setVisible(idx > 0)
        self.next_btn.setText("Create Booking ✓" if idx == 2 else "Next →")
        if idx == 2:
            self._refresh_slots()
        titles = ["New Booking — Customer", "New Booking — Product",
                  "New Booking — Bin"]
        self.title.setText(titles[idx])

    def _next(self):
        if self.step == 0:
            if not self.c_name.text().strip() or not self.c_contact.text().strip():
                self._warn("Customer name and contact are required.")
                return
            self._show_step(1)
        elif self.step == 1:
            if not self.p_name.text().strip():
                self._warn("Product name is required.")
                return
            self._show_step(2)
        else:
            if self.selected_slot is None:
                self._warn("Please select a free bin to place the item.")
                return
            bid = create_booking(
                self.c_name.text().strip(), self.c_contact.text().strip(),
                self.photo_path, self.p_name.text().strip(),
                self.p_fault.toPlainText().strip(), self.image_path, "",
                self.selected_slot)
            from PySide6.QtWidgets import QMessageBox
            QMessageBox.information(self, "Booked",
                                    f"Item placed in Bin {self.selected_slot}.")
            self.mw.show_product(bid)

    def _back(self):
        if self.step > 0:
            self._show_step(self.step - 1)

    def _warn(self, msg):
        from PySide6.QtWidgets import QMessageBox
        QMessageBox.warning(self, "Missing", msg)
