from PySide6.QtCore import Qt
from PySide6.QtWidgets import (
    QApplication, QHBoxLayout, QLabel, QPushButton, QSizePolicy,
    QStackedWidget, QVBoxLayout, QWidget,
)

from app.database import init_db
from app.theme import (
    ACCENT, BG, BORDER, MUTED, PRIMARY, SURFACE, TEXT, build_qss,
)
from app.ui.bins_page import BinsPage
from app.ui.booking_wizard import BookingWizard
from app.ui.history_page import HistoryPage
from app.ui.home_page import HomePage
from app.ui.product_page import ProductPage

NAV_ITEMS = [("Home", "home"), ("Bins", "bins"), ("History", "history")]


class MainWindow(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Paramathman Services — Self Management")
        self.resize(1280, 800)
        self.setMinimumSize(1080, 680)
        self._nav_buttons = {}

        root = QVBoxLayout(self)
        root.setContentsMargins(0, 0, 0, 0)
        root.setSpacing(0)

        root.addWidget(self._build_topbar())

        self.stack = QStackedWidget()
        root.addWidget(self.stack, 1)

        self.home = HomePage(self)
        self.bins = BinsPage(self)
        self.history = HistoryPage(self)
        self.product = ProductPage(self)
        self.wizard = BookingWizard(self)

        self.stack.addWidget(self.home)
        self.stack.addWidget(self.bins)
        self.stack.addWidget(self.history)
        self.stack.addWidget(self.product)
        self.stack.addWidget(self.wizard)

        self._nav_buttons = {}
        self.show_page("home")

    def _build_topbar(self):
        bar = QWidget()
        bar.setObjectName("topBar")
        bar.setFixedHeight(64)
        layout = QHBoxLayout(bar)
        layout.setContentsMargins(20, 0, 20, 0)
        layout.setSpacing(12)

        logo = QLabel("PS")
        logo.setObjectName("logoBadge")
        logo.setFixedSize(40, 40)
        logo.setAlignment(Qt.AlignmentFlag.AlignCenter)

        name_box = QVBoxLayout()
        name_box.setSpacing(0)
        brand = QLabel("Paramathman Services")
        brand.setObjectName("brandName")
        sub = QLabel("Self Management System")
        sub.setObjectName("brandSub")
        name_box.addWidget(brand)
        name_box.addWidget(sub)

        layout.addWidget(logo)
        layout.addLayout(name_box)
        layout.addStretch(1)

        for label, key in NAV_ITEMS:
            btn = QPushButton(label)
            btn.setProperty("variant", "nav")
            btn.setCursor(Qt.CursorShape.PointingHandCursor)
            btn.clicked.connect(lambda _, k=key: self.show_page(k))
            self._nav_buttons[key] = btn
            layout.addWidget(btn)

        return bar

    def _highlight_nav(self, key):
        for k, btn in self._nav_buttons.items():
            if k == key:
                btn.setStyleSheet(
                    f"background:{PRIMARY}; color:#fff; border-radius:9px;"
                    "padding:8px 18px; font-weight:700; font-size:13px;"
                )
            else:
                btn.setStyleSheet("")

    def show_page(self, key):
        self._highlight_nav(key)
        pages = {"home": self.home, "bins": self.bins,
                 "history": self.history, "product": self.product,
                 "wizard": self.wizard}
        page = pages[key]
        self.stack.setCurrentWidget(page)
        if hasattr(page, "refresh"):
            page.refresh()

    def new_booking(self):
        self.wizard.reset()
        self.show_page("wizard")

    def show_product(self, booking_id):
        self.product.load(booking_id)
        self.show_page("product")

    def refresh_all(self):
        for p in (self.home, self.bins, self.history):
            if hasattr(p, "refresh"):
                p.refresh()


def main():
    init_db()
    app = QApplication([])
    app.setStyleSheet(build_qss())
    win = MainWindow()
    win.show()
    return app.exec()


if __name__ == "__main__":
    main()
