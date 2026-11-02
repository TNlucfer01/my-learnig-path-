from random import randint
from typing import override
from PySide6.QtCore import QLine, QSize
from PySide6.QtGui import QMouseEvent, QAction
from PySide6.QtWidgets import (
    QApplication,
    QMenu,
    QLabel,
    QLineEdit,
    QMainWindow,
    QWidget,
    QVBoxLayout,
    QHBoxLayout,
    QGridLayout,
    QAbstractButton,
    QPushButton,
    QButtonGroup,
)

import sys


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

    def contextMenuEvent(self, e):
        context = QMenu(self)
        context.addAction(QAction("test 1", self))
        context.addAction(QAction("test 2", self))
        context.addAction(QAction("test 3", self))
        context.exec(e.globalPos())


class MainPage(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setMouseTracking(True)
        self.label = QLabel()
        self.label.setMouseTracking(True)
        self.label.setText(" click this label ")
        self.setCentralWidget(self.label)

    def mouseMoveEvent(self, event):
        self.label.setText("mouse event is happened")
        print(event)

    def mousePressEvent(self, event):
        self.label.setText("the  press eent is happened")

    def mouseReleaseEvent(self, event):
        self.label.setText("the monuse has clicked")


app = QApplication(sys.argv)

but = QPushButton("Push button")
# but.show()
main = MainWindow()
main.show()


#
# window = QWidget()
#
# windo = QWidget()
# window.show()
# array = ["QPushButton", "QAbstractButton", "QButtonGroup"]
# rand = randint(0, 3)
# for i in range(10):
#     rand = randint(0, 2)
#     f = f"wnd{i}={array[rand]}"
#     s = f"wnd{i}.show()"
#     exec(f)
#     exec(s)
#
#
# windo.show()
app.exec()


class Home(QMainWindow):
    def __init__(self):
        super().__init__()
        self.but_is_clicked = True
        self.setWindowTitle("hello world this us th eian page of the aplication")
        self.but = QPushButton("Push button")
        self.but.setCheckable(True)
        self.but.setFocus()
        self.but.clicked.connect(self.the_button_was_clicked)
        # self.but.clicked.connect(self.test)
        self.setCentralWidget(self.but)  # why does the error is silently failed there
        self.setFixedSize(QSize(512, 512))

        # these are some slots we have

    def the_button_was_clicked(self):
        self.but.setText("You already clicked me.")
        self.but.setEnabled(False)

        # Also change the window title.
        self.setWindowTitle("My Oneshot App")

    def the_button_click(self):
        self.but_is_clicked = self.but.isChecked()
        print(f"the button has been clicked,c1:{self.but_is_clicked} \n ")

    def test(self, c):
        print("Checked ?", c)


class Connecting_widgets(QMainWindow):
    def __init__(self):
        super().__init__()
        self.input = QLineEdit()
        self.label = QLabel()
        self.setWindowTitle("this is the app")
        self.wid = QWidget()
        layout = QVBoxLayout()
        self.input.textChanged.connect(self.label.setText)
        layout.addWidget(self.input)
        layout.addWidget(self.label)
        self.wid.setLayout(layout)
        self.setCentralWidget(self.wid)
