import QtQuick
import QtQuick.Shapes
import QtQuick.Controls.Basic

ApplicationWindow {
    id: root

    visible: true
    width: 1280
    height: 820
    minimumWidth: 900
    minimumHeight: 600
    title: "NEON MONOLITH"
    color: "#131313"

    // ── page registry ─────────────────────────────────────────────────────────
    readonly property var pages: [
        { label: "Home",     source: "Home_Page.qml"                    },
        { label: "About",    source: "About_Page.qml"                   },
        { label: "Products", source: "Product_Catalog.qml"              },
        { label: "Contact",  source: "Contact_Page.qml"                 },
        { label: "About ES", source: "About_Page_Electronics_Shop.qml"  },
        { label: "Contact ES", source: "Contact_Page_Electronics_Shop.qml" }
    ]
    property int currentPage: 0

    // ── custom top navigation bar ─────────────────────────────────────────────
    Rectangle {
        id: navbar
        z: 10
        anchors { top: parent.top; left: parent.left; right: parent.right }
        height: 54
        color: "#1a1a1a"

        // subtle bottom border
        Rectangle {
            anchors { bottom: parent.bottom; left: parent.left; right: parent.right }
            height: 1
            color: "#2a2a2a"
        }

        // brand name
        Text {
            anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: 24 }
            text: "NEON MONOLITH"
            color: "#fabd00"
            font.family: "Inter"
            font.pixelSize: 15
            font.weight: Font.Bold
            font.letterSpacing: 2
        }

        // nav buttons
        Row {
            anchors { verticalCenter: parent.verticalCenter; right: parent.right; rightMargin: 24 }
            spacing: 4

            Repeater {
                model: root.pages
                delegate: Rectangle {
                    required property int index
                    required property var modelData

                    width: navLabel.implicitWidth + 24
                    height: 34
                    radius: 6
                    color: root.currentPage === index
                           ? "#fabd00"
                           : navMouse.containsMouse ? "#2a2a2a" : "transparent"

                    Behavior on color { ColorAnimation { duration: 150 } }

                    Text {
                        id: navLabel
                        anchors.centerIn: parent
                        text: modelData.label
                        font.family: "Inter"
                        font.pixelSize: 13
                        font.weight: root.currentPage === index ? Font.Bold : Font.Normal
                        color: root.currentPage === index ? "#1a1a1a" : "#c1c6d7"
                        Behavior on color { ColorAnimation { duration: 150 } }
                    }

                    MouseArea {
                        id: navMouse
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            root.currentPage = index
                            pageScroll.contentY = 0   // scroll to top on page switch
                        }
                    }
                }
            }
        }
    }

    // ── scrollable page area ──────────────────────────────────────────────────
    ScrollView {
        id: pageScroll
        anchors {
            top: navbar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        contentWidth: root.width
        clip: true

        // custom scroll bar styling
        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AsNeeded
            contentItem: Rectangle {
                implicitWidth: 6
                radius: 3
                color: "#fabd0066"
            }
            background: Rectangle { color: "transparent" }
        }
        ScrollBar.horizontal: ScrollBar { policy: ScrollBar.AlwaysOff }

        // The Loader swaps between QML pages
        Loader {
            id: pageLoader
            source: root.pages[root.currentPage].source
            // center the fixed-width page in the window
            x: Math.max(0, (pageScroll.width - (item ? item.width : 1280)) / 2)

            onStatusChanged: {
                if (status === Loader.Error)
                    console.error("Failed to load:", source)
            }
        }
    }

    // ── loading indicator ─────────────────────────────────────────────────────
    Rectangle {
        visible: pageLoader.status === Loader.Loading
        anchors.fill: pageScroll
        color: "#131313"
        z: 5

        Text {
            anchors.centerIn: parent
            text: "Loading…"
            color: "#fabd00"
            font.family: "Inter"
            font.pixelSize: 18
        }
    }
}
