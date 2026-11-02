from PySide6.QtCore import Qt
from PySide6.QtWidgets import (
    QComboBox, QFileDialog, QFrame, QGridLayout, QHBoxLayout, QLabel,
    QLineEdit, QMessageBox, QPushButton, QScrollArea, QTextEdit, QVBoxLayout,
    QWidget,
)

from app.database import (
    collect_booking, delete_booking, get_booking, set_stage, update_booking,
)
from app.theme import (
    ACCENT, DANGER, MUTED, PRIMARY, STAGE_COLORS, TEXT, chip_qss,
)
from app.utils import clear_layout, fmt_dt, load_thumb


class ProductPage(QWidget):
    def __init__(self, mw):
        super().__init__()
        self.mw = mw
        self.booking = None
        self.editing = False
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

        back = QPushButton("← Back")
        back.setProperty("variant", "ghost")
        back.setCursor(Qt.CursorShape.PointingHandCursor)
        back.clicked.connect(lambda: self.mw.show_page("home"))
        self.title = QLabel()
        self.title.setObjectName("sectionTitle")
        self.edit_btn = QPushButton("✎ Edit")
        self.edit_btn.setProperty("variant", "ghost")
        self.edit_btn.setCursor(Qt.CursorShape.PointingHandCursor)
        self.edit_btn.clicked.connect(self._toggle_edit)
        h.addWidget(back)
        h.addWidget(self.title)
        h.addStretch(1)
        h.addWidget(self.edit_btn)
        root.addWidget(header)

        self.scroll_area = QScrollArea()
        self.scroll_area.setWidgetResizable(True)
        self.content = QWidget()
        self.content.setObjectName("scrollBody")
        self.clayout = QVBoxLayout(self.content)
        self.clayout.setContentsMargins(28, 24, 28, 24)
        self.clayout.setSpacing(20)
        self.scroll_area.setWidget(self.content)
        root.addWidget(self.scroll_area, 1)

        footer = QFrame()
        footer.setObjectName("topBar")
        footer.setFixedHeight(64)
        f = QHBoxLayout(footer)
        f.setContentsMargins(20, 0, 20, 0)
        f.setSpacing(12)
        self.delete_btn = QPushButton("🗑 Delete")
        self.delete_btn.setProperty("variant", "danger")
        self.delete_btn.setCursor(Qt.CursorShape.PointingHandCursor)
        self.delete_btn.clicked.connect(self._delete)
        self.collect_btn = QPushButton("📦 Mark Picked Up")
        self.collect_btn.setProperty("variant", "accent")
        self.collect_btn.setCursor(Qt.CursorShape.PointingHandCursor)
        self.collect_btn.clicked.connect(self._collect)
        f.addWidget(self.delete_btn)
        f.addWidget(self.collect_btn)
        f.addStretch(1)
        self.save_btn = QPushButton("💾 Save")
        self.save_btn.setProperty("variant", "primary")
        self.save_btn.setCursor(Qt.CursorShape.PointingHandCursor)
        self.save_btn.clicked.connect(self._save)
        f.addWidget(self.save_btn)
        root.addWidget(footer)

    def load(self, booking_id):
        self.booking = get_booking(booking_id)
        if not self.booking:
            QMessageBox.warning(self, "Not found", "This job no longer exists.")
            self.mw.show_page("home")
            return
        self.editing = False
        self._render()

    def _render(self):
        b = self.booking
        self.title.setText(f"Job #{b['id']}  ·  {b['product_name']}")
        clear_layout(self.clayout)

        card = QFrame()
        card.setObjectName("panel")
        cl = QVBoxLayout(card)
        cl.setContentsMargins(18, 18, 18, 18)
        cl.setSpacing(16)

        top = QHBoxLayout()
        self.prod_img = QLabel()
        self.prod_img.setFixedSize(360, 280)
        self.prod_img.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.prod_img.setStyleSheet("background:#0B1222; border-radius:14px;")
        self.prod_img.setPixmap(load_thumb(b.get("product_image"), 360, 280,
                                           b.get("product_name")))

        cust_box = QVBoxLayout()
        cust_box.setSpacing(10)
        self.cust_photo = QLabel()
        self.cust_photo.setFixedSize(76, 76)
        self.cust_photo.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.cust_photo.setStyleSheet("background:#0B1222; border-radius:38px;")
        self.cust_photo.setPixmap(load_thumb(b.get("photo_path"), 76, 76,
                                             b.get("customer_name")))
        self.cust_name = QLabel(b["customer_name"])
        self.cust_name.setObjectName("sectionTitle")
        self.cust_contact = QLabel(b.get("contact") or "No contact")
        self.cust_contact.setObjectName("mutedText")
        self.change_img = QPushButton("Change Image")
        self.change_img.setProperty("variant", "ghost")
        self.change_img.setCursor(Qt.CursorShape.PointingHandCursor)
        self.change_img.setFixedHeight(34)
        self.change_img.clicked.connect(self._pick_product_image)
        self.change_photo = QPushButton("Change Photo")
        self.change_photo.setProperty("variant", "ghost")
        self.change_photo.setCursor(Qt.CursorShape.PointingHandCursor)
        self.change_photo.setFixedHeight(34)
        self.change_photo.clicked.connect(self._pick_customer_photo)
        cust_box.addWidget(self.cust_photo)
        cust_box.addWidget(self.cust_name)
        cust_box.addWidget(self.cust_contact)
        cust_box.addStretch(1)
        cust_box.addWidget(self.change_img)
        cust_box.addWidget(self.change_photo)

        top.addWidget(self.prod_img, 0, Qt.AlignmentFlag.AlignTop)
        top.addSpacing(18)
        top.addLayout(cust_box)
        top.addStretch(1)
        cl.addLayout(top)

        grid = QGridLayout()
        grid.setSpacing(14)
        self.f_product_box = self._field("f_product", "Product Name", b["product_name"], QLineEdit())
        self.f_customer_box = self._field("f_customer", "Customer Name", b["customer_name"], QLineEdit())
        self.f_contact_box = self._field("f_contact", "Contact No", b.get("contact"), QLineEdit())
        self.f_fault_box = self._field("f_fault", "Fault", b.get("fault"), QTextEdit())
        self.f_notes_box = self._field("f_notes", "Notes", b.get("notes"), QTextEdit())
        self.f_stage_box = self._field("f_stage", "Stage", b["stage"], QComboBox())
        self.f_stage_w.addItems(["Received", "Not Fixed", "Fixing", "Finished"])

        grid.addWidget(self.f_product_box, 0, 0)
        grid.addWidget(self.f_customer_box, 0, 1)
        grid.addWidget(self.f_contact_box, 1, 0)
        grid.addWidget(self.f_stage_box, 1, 1)
        grid.addWidget(self.f_fault_box, 2, 0)
        grid.addWidget(self.f_notes_box, 2, 1)
        cl.addLayout(grid)

        meta = QHBoxLayout()
        self.bin_chip = QLabel(f"📦 Bin {b.get('bin_label', '-')}")
        self.bin_chip.setStyleSheet(chip_qss(PRIMARY))
        self.start_chip = QLabel(f"⏱ In: {fmt_dt(b['start_date'])}")
        self.start_chip.setObjectName("mutedText")
        end = fmt_dt(b["end_date"]) if b["end_date"] else "—"
        self.end_chip = QLabel(f"✅ Out: {end}")
        self.end_chip.setObjectName("mutedText")
        meta.addWidget(self.bin_chip)
        meta.addWidget(self.start_chip)
        meta.addWidget(self.end_chip)
        meta.addStretch(1)
        cl.addLayout(meta)

        self.clayout.addWidget(card)
        self._apply_edit_state()

    def _field(self, key, label, value, widget):
        box = QVBoxLayout()
        box.setSpacing(5)
        lbl = QLabel(label)
        lbl.setObjectName("fieldLabel")
        if isinstance(widget, QTextEdit):
            widget.setPlainText(value or "")
            widget.setFixedHeight(70)
        elif isinstance(widget, QComboBox):
            widget.setCurrentText(value or "")
        else:
            widget.setText(value or "")
        box.addWidget(lbl)
        box.addWidget(widget)
        setattr(self, key + "_w", widget)
        wrap = QWidget()
        wrap.setLayout(box)
        return wrap

    def _apply_edit_state(self):
        enabled = self.editing
        for w in (self.f_product_w, self.f_customer_w, self.f_contact_w,
                  self.f_fault_w, self.f_notes_w, self.f_stage_w):
            w.setEnabled(enabled)
        self.change_img.setVisible(enabled)
        self.change_photo.setVisible(enabled)
        self.save_btn.setVisible(enabled)
        self.edit_btn.setText("✕ Cancel" if enabled else "✎ Edit")
        b = self.booking
        self.collect_btn.setVisible(b is not None and bool(b.get("active")))

    def _toggle_edit(self):
        if self.editing:
            self._render()
        self.editing = not self.editing
        self._apply_edit_state()

    def _pick_product_image(self):
        path, _ = QFileDialog.getOpenFileName(
            self, "Select product image",
            "", "Images (*.png *.jpg *.jpeg *.bmp *.webp)")
        if path:
            self.booking["product_image"] = path
            self.prod_img.setPixmap(load_thumb(path, 360, 280,
                                               self.booking.get("product_name")))

    def _pick_customer_photo(self):
        path, _ = QFileDialog.getOpenFileName(
            self, "Select customer photo",
            "", "Images (*.png *.jpg *.jpeg *.bmp *.webp)")
        if path:
            self.booking["photo_path"] = path
            self.cust_photo.setPixmap(load_thumb(path, 76, 76,
                                                 self.booking.get("customer_name")))

    def _save(self):
        b = self.booking
        fields = {
            "product_name": self.f_product_w.text().strip(),
            "customer_name": self.f_customer_w.text().strip(),
            "contact": self.f_contact_w.text().strip(),
            "fault": self.f_fault_w.toPlainText().strip(),
            "notes": self.f_notes_w.toPlainText().strip(),
            "product_image": b.get("product_image"),
            "photo_path": b.get("photo_path"),
        }
        if not fields["product_name"] or not fields["customer_name"]:
            QMessageBox.warning(self, "Missing", "Product and customer name are required.")
            return
        update_booking(b["id"], fields)
        new_stage = self.f_stage_w.currentText()  # noqa
        if new_stage != b["stage"]:
            set_stage(b["id"], new_stage)
        self.booking = get_booking(b["id"])
        self.editing = False
        self._render()
        self.mw.refresh_all()
        QMessageBox.information(self, "Saved", "Job details updated.")

    def _collect(self):
        b = self.booking
        r = QMessageBox.question(
            self, "Mark Picked Up",
            f"Release Bin {b.get('bin_label')} for {b['customer_name']}?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No)
        if r == QMessageBox.StandardButton.Yes:
            collect_booking(b["id"])
            self.mw.refresh_all()
            self.mw.show_page("bins")

    def _delete(self):
        b = self.booking
        r = QMessageBox.question(
            self, "Delete", f"Delete job #{b['id']} permanently?",
            QMessageBox.StandardButton.Yes | QMessageBox.StandardButton.No)
        if r == QMessageBox.StandardButton.Yes:
            delete_booking(b["id"])
            self.mw.refresh_all()
            self.mw.show_page("home")
