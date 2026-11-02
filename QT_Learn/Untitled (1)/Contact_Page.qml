import QtQuick
import QtQuick.Shapes

Rectangle {
    id: contact_Page

    height: 1784
    width: 1280

    color: "#131313"

    Rectangle {
        id: main

        height: 1496.48
        width: 1280

        color: "transparent"

        Rectangle {
            id: header_Hero_Section

            x: 24
            y: 128

            height: 201.50
            width: 1232

            color: "transparent"

            Rectangle {
                id: background

                height: 23
                width: 177.89

                color: "#00e3fd"
                radius: 2

                Text {
                    id: _text

                    x: 12
                    y: 4

                    height: 15
                    width: 156

                    color: "#00616d"
                    font.capitalization: Font.AllUppercase
                    font.family: "Inter"
                    font.letterSpacing: 1
                    font.pixelSize: 10
                    font.weight: Font.Bold
                    horizontalAlignment: Text.AlignLeft
                    lineHeight: 15
                    lineHeightMode: Text.FixedHeight
                    text: "CONNECT WITH THE CORE"
                    textFormat: Text.PlainText
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                }
            }
            Rectangle {
                id: heading_1

                y: 55

                height: 72
                width: 1232

                color: "transparent"

                Image {
                    id: _text_1

                    source: Qt.resolvedUrl("assets/_text_1.png")
                }
            }
            Rectangle {
                id: container

                y: 143

                height: 59
                width: 672

                color: "transparent"

                Text {
                    id: _text_2

                    height: 59
                    width: 626

                    color: "#a3a3a3"
                    font.family: "Inter"
                    font.pixelSize: 18
                    font.weight: Font.Normal
                    horizontalAlignment: Text.AlignLeft
                    lineHeight: 29.25
                    lineHeightMode: Text.FixedHeight
                    text: "Our engineers and curators are standing by to facilitate your next high-\nperformance hardware acquisition. Select a communication vector below."
                    textFormat: Text.PlainText
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                }
            }
        }
        Rectangle {
            id: contact_Grid

            x: 24
            y: 409.50

            height: 406
            width: 1232

            color: "transparent"

            Rectangle {
                id: whatsApp_Card

                height: 406
                width: 389.33

                color: "#1c1b1b"
                radius: 4

                Rectangle {
                    id: _margin

                    x: 32
                    y: 32

                    height: 286
                    width: 325.33

                    color: "transparent"

                    Rectangle {
                        id: container_1

                        height: 238
                        width: 325.33

                        color: "transparent"

                        Rectangle {
                            id: background_1

                            height: 64
                            width: 64

                            color: "#201f1f"
                            radius: 12

                            Rectangle {
                                id: container_2

                                x: 17
                                y: 17

                                height: 30
                                width: 30

                                color: "transparent"

                                Image {
                                    id: icon

                                    source: Qt.resolvedUrl("assets/icon_19.png")
                                }
                            }
                        }
                        Rectangle {
                            id: heading_3

                            y: 88

                            height: 32
                            width: 325.33

                            color: "transparent"

                            Text {
                                id: _text_3

                                height: 32
                                width: 125

                                color: "#e5e2e1"
                                font.family: "Space Grotesk"
                                font.pixelSize: 24
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 32
                                lineHeightMode: Text.FixedHeight
                                text: "WHATSAPP"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        Rectangle {
                            id: container_3

                            y: 128

                            height: 16
                            width: 325.33

                            color: "transparent"

                            Text {
                                id: _text_4

                                height: 16
                                width: 172

                                color: "#737373"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.letterSpacing: 1.20
                                font.pixelSize: 12
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 16
                                lineHeightMode: Text.FixedHeight
                                text: "INSTANT CONNECTIVITY"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_4

                            y: 160

                            height: 78
                            width: 325.33

                            color: "transparent"

                            Text {
                                id: _text_5

                                height: 78
                                width: 317

                                color: "#a3a3a3"
                                font.family: "Inter"
                                font.pixelSize: 16
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 26
                                lineHeightMode: Text.FixedHeight
                                text: "Speak directly with our technical support\nteam for real-time build consultations and\norder updates."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
                Shape {
                    id: link

                    x: 32
                    y: 318

                    height: 56
                    width: 325.33

                    ShapePath {
                        id: linkShapePath

                        strokeColor: "#000"
                        strokeWidth: 0

                        fillGradient: LinearGradient {
                            id: gradientNode
                        
                            x1: link.width * 0.20696678894689466
                            x2: link.width * 0.793033250283827
                            y1: link.height * -1.2023661277570896
                            y2: link.height * 2.202366102785473
                        
                            GradientStop {
                                color: "#fffabd00"
                                position: 0
                            }
                            GradientStop {
                                color: "#ffb78a00"
                                position: 1
                            }
                        }

                        PathRectangle {
                            id: linkPathRectangle

                            x: 0
                            y: 0

                            height: link.height
                            width: link.width

                            radius: 12
                        }
                    }
                    Rectangle {
                        id: container_5

                        x: 95.97
                        y: 16

                        height: 24
                        width: 116.06

                        color: "transparent"

                        Text {
                            id: _text_6

                            height: 24
                            width: 118

                            color: "#3f2e00"
                            font.family: "Inter"
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 24
                            lineHeightMode: Text.FixedHeight
                            text: "INITIATE CHAT"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: _margin_1

                        x: 212.03
                        y: 23.33

                        height: 9.33
                        width: 17.33

                        color: "transparent"

                        Image {
                            id: icon_1

                            x: 8

                            source: Qt.resolvedUrl("assets/icon_20.png")
                        }
                    }
                }
            }
            Rectangle {
                id: email_Card

                x: 421.33

                height: 406
                width: 389.33

                color: "#1c1b1b"
                radius: 4

                Rectangle {
                    id: _margin_2

                    x: 32
                    y: 32

                    height: 286
                    width: 325.33

                    color: "transparent"

                    Rectangle {
                        id: container_6

                        height: 238
                        width: 325.33

                        color: "transparent"

                        Rectangle {
                            id: background_2

                            height: 64
                            width: 64

                            color: "#201f1f"
                            radius: 12

                            Rectangle {
                                id: container_7

                                x: 17
                                y: 17

                                height: 30
                                width: 30

                                color: "transparent"

                                Image {
                                    id: icon_2

                                    source: Qt.resolvedUrl("assets/icon_21.png")
                                }
                            }
                        }
                        Rectangle {
                            id: heading_4

                            y: 88

                            height: 32
                            width: 325.33

                            color: "transparent"

                            Text {
                                id: _text_7

                                height: 32
                                width: 71

                                color: "#e5e2e1"
                                font.family: "Space Grotesk"
                                font.pixelSize: 24
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 32
                                lineHeightMode: Text.FixedHeight
                                text: "EMAIL"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        Rectangle {
                            id: container_8

                            y: 128

                            height: 16
                            width: 325.33

                            color: "transparent"

                            Text {
                                id: _text_8

                                height: 16
                                width: 132

                                color: "#737373"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.letterSpacing: 1.20
                                font.pixelSize: 12
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 16
                                lineHeightMode: Text.FixedHeight
                                text: "SECURE INQUIRIES"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_9

                            y: 160

                            height: 78
                            width: 325.33

                            color: "transparent"

                            Text {
                                id: _text_9

                                height: 78
                                width: 308

                                color: "#a3a3a3"
                                font.family: "Inter"
                                font.pixelSize: 16
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 26
                                lineHeightMode: Text.FixedHeight
                                text: "For enterprise procurement, global\nshipping logistics, and detailed technical\nspecifications."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
                Rectangle {
                    id: link_1

                    x: 32
                    y: 318

                    height: 56
                    width: 325.33

                    border.color: "#338b90a0"
                    border.width: 1
                    color: "transparent"
                    radius: 12

                    Rectangle {
                        id: container_10

                        x: 86.98
                        y: 16

                        height: 24
                        width: 132.28

                        color: "transparent"

                        Text {
                            id: _text_10

                            height: 24
                            width: 134

                            color: "#fabd00"
                            font.family: "Inter"
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 24
                            lineHeightMode: Text.FixedHeight
                            text: "TRANSMIT DATA"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: _margin_3

                        x: 219.27
                        y: 23.33

                        height: 9.33
                        width: 19.08

                        color: "transparent"

                        Image {
                            id: icon_3

                            x: 8

                            source: Qt.resolvedUrl("assets/icon_22.png")
                        }
                    }
                }
            }
            Rectangle {
                id: location_Card

                x: 842.67

                height: 406
                width: 389.33

                color: "#1c1b1b"
                radius: 4

                Rectangle {
                    id: _margin_4

                    x: 32
                    y: 32

                    height: 286
                    width: 325.33

                    color: "transparent"

                    Rectangle {
                        id: container_11

                        height: 238
                        width: 325.33

                        color: "transparent"

                        Rectangle {
                            id: background_3

                            height: 64
                            width: 64

                            color: "#201f1f"
                            radius: 12

                            Rectangle {
                                id: container_12

                                x: 20
                                y: 17

                                height: 30
                                width: 24

                                color: "transparent"

                                Image {
                                    id: icon_4

                                    source: Qt.resolvedUrl("assets/icon_23.png")
                                }
                            }
                        }
                        Rectangle {
                            id: heading_5

                            y: 88

                            height: 32
                            width: 325.34

                            color: "transparent"

                            Text {
                                id: _text_11

                                height: 32
                                width: 138

                                color: "#e5e2e1"
                                font.family: "Space Grotesk"
                                font.pixelSize: 24
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 32
                                lineHeightMode: Text.FixedHeight
                                text: "SHOWROOM"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        Rectangle {
                            id: container_13

                            y: 128

                            height: 16
                            width: 325.34

                            color: "transparent"

                            Text {
                                id: _text_12

                                height: 16
                                width: 115

                                color: "#737373"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.letterSpacing: 1.20
                                font.pixelSize: 12
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 16
                                lineHeightMode: Text.FixedHeight
                                text: "PHYSICAL NODE"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_14

                            y: 160

                            height: 78
                            width: 325.34

                            color: "transparent"

                            Text {
                                id: _text_13

                                height: 78
                                width: 313

                                color: "#a3a3a3"
                                font.family: "Inter"
                                font.pixelSize: 16
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 26
                                lineHeightMode: Text.FixedHeight
                                text: "Experience the Monolith in person. Our\nflagship showroom is located in the heart\nof the tech district."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
                Rectangle {
                    id: link_2

                    x: 32
                    y: 318

                    height: 56
                    width: 325.33

                    border.color: "#338b90a0"
                    border.width: 1
                    color: "transparent"
                    radius: 12

                    Rectangle {
                        id: container_15

                        x: 80.38
                        y: 16

                        height: 24
                        width: 146.08

                        color: "transparent"

                        Text {
                            id: _text_14

                            height: 24
                            width: 148

                            color: "#bdf4ff"
                            font.family: "Inter"
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 24
                            lineHeightMode: Text.FixedHeight
                            text: "NAVIGATE TO HUB"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: _margin_5

                        x: 226.46
                        y: 22.75

                        height: 10.50
                        width: 18.50

                        color: "transparent"

                        Image {
                            id: icon_5

                            x: 8

                            source: Qt.resolvedUrl("assets/icon_24.png")
                        }
                    }
                }
            }
        }
        Rectangle {
            id: embedded_Map_Secondary_Content_Section

            x: 24
            y: 895.50

            height: 392.98
            width: 1232

            color: "transparent"

            Rectangle {
                id: container_16

                x: 746.67
                y: 34.99

                height: 323
                width: 485.33

                color: "transparent"

                Rectangle {
                    id: container_17

                    height: 183
                    width: 485.33

                    color: "transparent"

                    Rectangle {
                        id: heading_2

                        height: 36
                        width: 485.33

                        color: "transparent"

                        Text {
                            id: tECHNICAL_SUPPORT_HOURS

                            height: 36
                            width: 487

                            color: "#e5e2e1"
                            font.family: "Space Grotesk"
                            font.pixelSize: 30
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 36
                            lineHeightMode: Text.FixedHeight
                            text: "TECHNICAL SUPPORT HOURS"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: container_18

                        y: 52

                        height: 131
                        width: 485.33

                        color: "transparent"

                        Image {
                            id: horizontalBorder

                            source: Qt.resolvedUrl("assets/horizontalBorder_5.png")

                            Rectangle {
                                id: container_19

                                height: 24
                                width: 151.22

                                color: "transparent"

                                Text {
                                    id: _text_15

                                    height: 24
                                    width: 153

                                    color: "#a3a3a3"
                                    font.family: "Inter"
                                    font.pixelSize: 16
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 24
                                    lineHeightMode: Text.FixedHeight
                                    text: "MONDAY — FRIDAY"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_20

                                x: 333.28

                                height: 24
                                width: 152.05

                                color: "transparent"

                                Text {
                                    id: _text_16

                                    height: 24
                                    width: 154

                                    color: "#9cf0ff"
                                    font.family: "Inter"
                                    font.pixelSize: 16
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 24
                                    lineHeightMode: Text.FixedHeight
                                    text: "08:00 — 22:00 UTC"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Image {
                            id: horizontalBorder_1

                            y: 49

                            source: Qt.resolvedUrl("assets/horizontalBorder_6.png")

                            Rectangle {
                                id: container_21

                                height: 24
                                width: 84.20

                                color: "transparent"

                                Text {
                                    id: _text_17

                                    height: 24
                                    width: 86

                                    color: "#a3a3a3"
                                    font.family: "Inter"
                                    font.pixelSize: 16
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 24
                                    lineHeightMode: Text.FixedHeight
                                    text: "SATURDAY"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_22

                                x: 339.78

                                height: 24
                                width: 145.55

                                color: "transparent"

                                Text {
                                    id: _text_18

                                    height: 24
                                    width: 147

                                    color: "#9cf0ff"
                                    font.family: "Inter"
                                    font.pixelSize: 16
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 24
                                    lineHeightMode: Text.FixedHeight
                                    text: "10:00 — 18:00 UTC"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Image {
                            id: horizontalBorder_2

                            y: 98

                            source: Qt.resolvedUrl("assets/horizontalBorder_7.png")

                            Rectangle {
                                id: container_23

                                height: 24
                                width: 65.95

                                color: "transparent"

                                Text {
                                    id: _text_19

                                    height: 24
                                    width: 67

                                    color: "#a3a3a3"
                                    font.family: "Inter"
                                    font.pixelSize: 16
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 24
                                    lineHeightMode: Text.FixedHeight
                                    text: "SUNDAY"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_24

                                x: 234.94

                                height: 24
                                width: 250.39

                                color: "transparent"

                                Text {
                                    id: _text_20

                                    height: 24
                                    width: 252

                                    color: "#fabd00"
                                    font.family: "Inter"
                                    font.pixelSize: 16
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 24
                                    lineHeightMode: Text.FixedHeight
                                    text: "EMERGENCY PROTOCOLS ONLY"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                    }
                }
                Image {
                    id: background_VerticalBorder

                    y: 215

                    source: Qt.resolvedUrl("assets/background_VerticalBorder.png")

                    Rectangle {
                        id: container_25

                        x: 28
                        y: 24

                        height: 60
                        width: 433.33

                        color: "transparent"

                        Text {
                            id: our_commitment_to_engineering_excellence_extends

                            height: 60
                            width: 435

                            color: "#d4d4d4"
                            font.family: "Inter"
                            font.italic: true
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            text: "\"Our commitment to engineering excellence extends to our\ncommunication. Expect a response within 4 cycles (hours) during\nstandard operations.\""
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
            Rectangle {
                id: background_4

                height: 392.98
                width: 698.67

                clip: true
                color: "#ffffff"
                radius: 8

                Image {
                    id: aB6AXuC5ppPSQgaaMJrO8sYH05ViHx0jz6AL7h0mSKiuZ6h5

                    clip: true
                    source: Qt.resolvedUrl("assets/aB6AXuC5ppPSQgaaMJrO8sYH05ViHx0jz6AL7h0mSKiuZ6h5.png")
                }
                Rectangle {
                    id: overlay

                    height: 392.98
                    width: 698.66

                    color: "#0dfabd00"
                }
                Image {
                    id: overlay_OverlayBlur

                    x: 24
                    y: 296.98

                    source: Qt.resolvedUrl("assets/overlay_OverlayBlur.png")
                }
            }
        }
    }
    Rectangle {
        id: footer

        y: 1496.48

        height: 285
        width: 1280

        color: "#0a0a0a"

        Rectangle {
            id: container_26

            y: 80

            height: 165
            width: 1280

            color: "transparent"

            Text {
                id: _text_21

                x: 550.58

                height: 28
                width: 182

                color: "#f5f5f5"
                font.capitalization: Font.AllUppercase
                font.family: "Inter"
                font.letterSpacing: 1.80
                font.pixelSize: 18
                font.weight: Font.Bold
                horizontalAlignment: Text.AlignHCenter
                lineHeight: 28
                lineHeightMode: Text.FixedHeight
                text: "NEON MONOLITH"
                textFormat: Text.PlainText
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
            }
            Rectangle {
                id: _margin_6

                x: 306.17
                y: 28

                height: 52
                width: 667.65

                color: "transparent"

                Rectangle {
                    id: container_27

                    y: 32

                    height: 20
                    width: 667.65

                    color: "transparent"

                    Rectangle {
                        id: link_3

                        height: 20
                        width: 92.58

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_22

                            height: 20
                            width: 94

                            color: "#737373"
                            font.family: "Inter"
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            text: "Privacy Policy"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: link_4

                        x: 116.58

                        height: 20
                        width: 112.77

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_23

                            height: 20
                            width: 114

                            color: "#737373"
                            font.family: "Inter"
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            text: "Terms of Service"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: link_5

                        x: 253.35

                        height: 20
                        width: 108.80

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_24

                            height: 20
                            width: 110

                            color: "#fbbf24"
                            font.family: "Inter"
                            font.pixelSize: 14
                            font.underline: true
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            text: "Contact Support"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: link_6

                        x: 386.15

                        height: 20
                        width: 58.05

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_25

                            height: 20
                            width: 60

                            color: "#737373"
                            font.family: "Inter"
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            text: "Shipping"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: link_7

                        x: 468.20

                        height: 20
                        width: 50.98

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_26

                            height: 20
                            width: 52

                            color: "#737373"
                            font.family: "Inter"
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            text: "Returns"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: link_8

                        x: 543.18

                        height: 20
                        width: 124.47

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_27

                            height: 20
                            width: 126

                            color: "#737373"
                            font.family: "Inter"
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            text: "Global Showrooms"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
            Rectangle {
                id: _margin_7

                x: 16
                y: 80

                height: 85
                width: 1248

                color: "transparent"

                Image {
                    id: horizontalBorder_3

                    y: 32

                    source: Qt.resolvedUrl("assets/horizontalBorder_8.png")

                    Rectangle {
                        id: container_28

                        y: 33

                        height: 20
                        width: 1248

                        color: "transparent"

                        Text {
                            id: _text_28

                            x: 456.51

                            height: 20
                            width: 337

                            color: "#525252"
                            font.capitalization: Font.AllUppercase
                            font.family: "Inter"
                            font.letterSpacing: 1
                            font.pixelSize: 10
                            font.weight: Font.Medium
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            text: "© 2024 NEON MONOLITH. ENGINEERED FOR HAUTE TECH."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }
    }
    Image {
        id: topNavBar

        source: Qt.resolvedUrl("assets/topNavBar_2.png")
    }
}