import sys
import os

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtCore import QUrl

# ── Resolve the directory that contains this script ───────────────────────────
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

app = QGuiApplication(sys.argv)
app.setApplicationName("NEON MONOLITH")
app.setOrganizationName("NeonMonolith")

engine = QQmlApplicationEngine()

# Make the base directory available as a QML import path so that
# relative asset URLs (e.g. "assets/...") are resolved correctly.
engine.addImportPath(BASE_DIR)

# Load the shell (window + navigation) that we created alongside the pages.
shell_url = QUrl.fromLocalFile(os.path.join(BASE_DIR, "AppShell.qml"))
engine.load(shell_url)

if not engine.rootObjects():
    print("ERROR: Failed to load AppShell.qml", file=sys.stderr)
    sys.exit(1)

sys.exit(app.exec())
