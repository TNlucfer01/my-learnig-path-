import QtQuick
import QtQuick.Shapes

Rectangle {
    id: product_Catalog

    height: 2343
    width: 1280

    color: "#131313"

    Rectangle {
        id: main

        height: 2038
        width: 1280

        color: "transparent"

        Rectangle {
            id: new_Arrivals_Carousel_Section

            y: 112

            height: 686
            width: 1280

            color: "transparent"

            Rectangle {
                id: container

                x: 32

                height: 72
                width: 1216

                color: "transparent"

                Rectangle {
                    id: paragraph

                    height: 72
                    width: 211.22

                    color: "transparent"

                    Text {
                        id: _text

                        height: 24
                        width: 173

                        color: "#bdf4ff"
                        font.capitalization: Font.AllUppercase
                        font.family: "Inter"
                        font.letterSpacing: 3.20
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 24
                        lineHeightMode: Text.FixedHeight
                        text: "Limited Series"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                    Text {
                        id: heading_2_New_Arrivals

                        y: 32

                        height: 40
                        width: 213

                        color: "#e5e2e1"
                        font.family: "Space Grotesk"
                        font.pixelSize: 36
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 40
                        lineHeightMode: Text.FixedHeight
                        text: "New Arrivals"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: container_1

                    x: 1148.46
                    y: 34

                    height: 38
                    width: 67.54

                    color: "transparent"

                    Rectangle {
                        id: button

                        height: 38
                        width: 29.77

                        border.color: "#33414755"
                        border.width: 1
                        color: "transparent"

                        Rectangle {
                            id: container_2

                            x: 9
                            y: 9

                            height: 20
                            width: 11.77

                            color: "transparent"

                            Image {
                                id: icon

                                source: Qt.resolvedUrl("assets/icon_11.png")
                            }
                        }
                    }
                    Rectangle {
                        id: button_margin

                        x: 29.76

                        height: 38
                        width: 37.78

                        color: "transparent"

                        Rectangle {
                            id: button_1

                            x: 8

                            height: 38
                            width: 29.77

                            border.color: "#33414755"
                            border.width: 1
                            color: "transparent"

                            Rectangle {
                                id: container_3

                                x: 9
                                y: 9

                                height: 20
                                width: 11.77

                                color: "transparent"

                                Image {
                                    id: icon_1

                                    source: Qt.resolvedUrl("assets/icon_12.png")
                                }
                            }
                        }
                    }
                }
            }
            Rectangle {
                id: container_4

                x: 32
                y: 104

                height: 582
                width: 1216

                clip: true
                color: "transparent"

                Rectangle {
                    id: carousel_Items

                    height: 550
                    width: 450

                    color: "transparent"

                    Rectangle {
                        id: background

                        height: 550
                        width: 450

                        clip: true
                        color: "#1c1b1b"
                        radius: 4

                        Image {
                            id: aB6AXuAtJY0dbDnQgRAbNUpAvGa5wfKbRWF2tfiLkqhPbbxB

                            clip: true
                            source: Qt.resolvedUrl("assets/aB6AXuAtJY0dbDnQgRAbNUpAvGa5wfKbRWF2tfiLkqhPbbxB.png")
                        }
                    }
                    Rectangle {
                        id: container_5

                        x: 32
                        y: 430

                        height: 88
                        width: 159.34

                        color: "transparent"

                        Rectangle {
                            id: background_1

                            height: 24
                            width: 72.67

                            color: "#00e3fd"

                            Text {
                                id: _text_1

                                x: 8
                                y: 4

                                height: 16
                                width: 58

                                color: "#00616d"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.pixelSize: 12
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 16
                                lineHeightMode: Text.FixedHeight
                                text: "In Stock"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: heading_3

                            y: 32

                            height: 32
                            width: 159.34

                            color: "transparent"

                            Text {
                                id: _text_2

                                height: 32
                                width: 161

                                color: "#ffffff"
                                font.family: "Space Grotesk"
                                font.pixelSize: 24
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 32
                                lineHeightMode: Text.FixedHeight
                                text: "Xenon Pro X-1"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        Rectangle {
                            id: container_6

                            y: 64

                            height: 24
                            width: 159.34

                            color: "transparent"

                            Text {
                                id: _text_3

                                height: 24
                                width: 82

                                color: "#bdf4ff"
                                font.family: "Inter"
                                font.pixelSize: 16
                                font.weight: Font.Medium
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 24
                                lineHeightMode: Text.FixedHeight
                                text: "$3,499.00"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
                Rectangle {
                    id: _margin

                    x: 450

                    height: 550
                    width: 474

                    color: "transparent"

                    Rectangle {
                        id: container_7

                        x: 24

                        height: 550
                        width: 450

                        color: "transparent"

                        Rectangle {
                            id: background_2

                            height: 550
                            width: 450

                            clip: true
                            color: "#1c1b1b"
                            radius: 4

                            Image {
                                id: aB6AXuDRADjFe_ZLzoXzIf0pvmevxEuxytjL3fYA8dnbD_rf

                                clip: true
                                source: Qt.resolvedUrl("assets/aB6AXuDRADjFe_ZLzoXzIf0pvmevxEuxytjL3fYA8dnbD_rf.png")
                            }
                        }
                        Rectangle {
                            id: container_8

                            x: 32
                            y: 430

                            height: 88
                            width: 174.63

                            color: "transparent"

                            Rectangle {
                                id: background_3

                                height: 24
                                width: 70.89

                                color: "#00e3fd"

                                Text {
                                    id: _text_4

                                    x: 8
                                    y: 4

                                    height: 16
                                    width: 56

                                    color: "#00616d"
                                    font.capitalization: Font.AllUppercase
                                    font.family: "Inter"
                                    font.pixelSize: 12
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 16
                                    lineHeightMode: Text.FixedHeight
                                    text: "Edition I"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: heading_4

                                y: 32

                                height: 32
                                width: 174.63

                                color: "transparent"

                                Text {
                                    id: _text_5

                                    height: 32
                                    width: 176

                                    color: "#ffffff"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 24
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 32
                                    lineHeightMode: Text.FixedHeight
                                    text: "Prism 49\" Ultra"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_9

                                y: 64

                                height: 24
                                width: 174.63

                                color: "transparent"

                                Text {
                                    id: _text_6

                                    height: 24
                                    width: 78

                                    color: "#bdf4ff"
                                    font.family: "Inter"
                                    font.pixelSize: 16
                                    font.weight: Font.Medium
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 24
                                    lineHeightMode: Text.FixedHeight
                                    text: "$1,899.00"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                    }
                }
                Rectangle {
                    id: _margin_1

                    x: 924

                    height: 550
                    width: 474

                    color: "transparent"

                    Rectangle {
                        id: container_10

                        x: 24

                        height: 550
                        width: 450

                        color: "transparent"

                        Rectangle {
                            id: background_4

                            height: 550
                            width: 450

                            clip: true
                            color: "#1c1b1b"
                            radius: 4

                            Image {
                                id: aB6AXuBBIsB_uMuLdyvNYcbw_KjiHVAE_29D2X8NePcYUEqB

                                clip: true
                                source: Qt.resolvedUrl("assets/aB6AXuBBIsB_uMuLdyvNYcbw_KjiHVAE_29D2X8NePcYUEqB.png")
                            }
                        }
                        Rectangle {
                            id: container_11

                            x: 32
                            y: 430

                            height: 88
                            width: 200.86

                            color: "transparent"

                            Rectangle {
                                id: background_5

                                height: 24
                                width: 80.69

                                color: "#00e3fd"

                                Text {
                                    id: _text_7

                                    x: 8
                                    y: 4

                                    height: 16
                                    width: 66

                                    color: "#00616d"
                                    font.capitalization: Font.AllUppercase
                                    font.family: "Inter"
                                    font.pixelSize: 12
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 16
                                    lineHeightMode: Text.FixedHeight
                                    text: "New Drop"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: heading_5

                                y: 32

                                height: 32
                                width: 200.86

                                color: "transparent"

                                Text {
                                    id: _text_8

                                    height: 32
                                    width: 202

                                    color: "#ffffff"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 24
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 32
                                    lineHeightMode: Text.FixedHeight
                                    text: "Monolith Deck v2"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_12

                                y: 64

                                height: 24
                                width: 200.86

                                color: "transparent"

                                Text {
                                    id: _text_9

                                    height: 24
                                    width: 67

                                    color: "#bdf4ff"
                                    font.family: "Inter"
                                    font.pixelSize: 16
                                    font.weight: Font.Medium
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 24
                                    lineHeightMode: Text.FixedHeight
                                    text: "$249.00"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            id: section_Product_Grid_with_Categories

            y: 878

            height: 1080
            width: 1280

            color: "transparent"

            Rectangle {
                id: category_Computing

                x: 32

                height: 540
                width: 1216

                color: "transparent"

                Rectangle {
                    id: container_13

                    height: 36
                    width: 1216

                    color: "transparent"

                    Rectangle {
                        id: heading_2

                        height: 36
                        width: 344.50

                        color: "transparent"

                        Text {
                            id: _text_10

                            height: 36
                            width: 346

                            color: "#e5e2e1"
                            font.family: "Space Grotesk"
                            font.pixelSize: 30
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 36
                            lineHeightMode: Text.FixedHeight
                            text: "Laptops & Workstations"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: _margin_2

                        x: 344.50
                        y: 17.50

                        height: 1
                        width: 871.50

                        color: "transparent"

                        Rectangle {
                            id: horizontal_Divider

                            x: 16

                            height: 1
                            width: 855.50

                            color: "#33414755"
                        }
                    }
                }
                Rectangle {
                    id: container_14

                    y: 76

                    height: 464
                    width: 1216

                    color: "transparent"

                    Rectangle {
                        id: product_Card

                        height: 464
                        width: 280

                        color: "#1c1b1b"
                        radius: 4

                        Rectangle {
                            id: container_15

                            x: 16
                            y: 288

                            height: 96
                            width: 248

                            color: "transparent"

                            Rectangle {
                                id: heading_6

                                height: 28
                                width: 248

                                color: "transparent"

                                Text {
                                    id: titan_16_Workstation

                                    height: 28
                                    width: 249

                                    color: "#e5e2e1"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 18
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 28
                                    lineHeightMode: Text.FixedHeight
                                    text: "Titan 16 Workstation"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_16

                                y: 32

                                height: 20
                                width: 248

                                color: "transparent"

                                Text {
                                    id: core_i9_64GB_RAM_2TB_NVMe

                                    height: 20
                                    width: 249

                                    color: "#9cf0ff"
                                    font.family: "Inter"
                                    font.pixelSize: 14
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 20
                                    lineHeightMode: Text.FixedHeight
                                    text: "Core i9 • 64GB RAM • 2TB NVMe"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_17

                                y: 56

                                height: 40
                                width: 248

                                color: "transparent"

                                Text {
                                    id: element

                                    y: 12

                                    height: 28
                                    width: 249

                                    color: "#ffffff"
                                    font.family: "Inter"
                                    font.pixelSize: 20
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 28
                                    lineHeightMode: Text.FixedHeight
                                    text: "$4,299.00"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Rectangle {
                            id: button_margin_1

                            x: 16
                            y: 384

                            height: 64
                            width: 248

                            color: "transparent"

                            Shape {
                                id: button_2

                                y: 24

                                height: 40
                                width: 248

                                ShapePath {
                                    id: button_2ShapePath

                                    strokeColor: "#000"
                                    strokeWidth: 0

                                    fillGradient: LinearGradient {
                                        id: gradientNode
                                    
                                        x1: button_2.width * 0.4746450446913303
                                        x2: button_2.width * 0.5253549837816488
                                        y1: button_2.height * 1.4746450446913304
                                        y2: button_2.height * -0.4746450162183513
                                    
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
                                        id: button_2PathRectangle

                                        x: 0
                                        y: 0

                                        height: button_2.height
                                        width: button_2.width

                                        radius: 12
                                    }
                                }
                                Text {
                                    id: _text_11

                                    x: 74.41
                                    y: 12

                                    height: 16
                                    width: 102

                                    color: "#3f2e00"
                                    font.capitalization: Font.AllUppercase
                                    font.family: "Inter"
                                    font.letterSpacing: 1.20
                                    font.pixelSize: 12
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignHCenter
                                    lineHeight: 16
                                    lineHeightMode: Text.FixedHeight
                                    text: "View Details"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Rectangle {
                            id: _margin_3

                            x: 16
                            y: 16

                            height: 272
                            width: 248

                            color: "transparent"

                            Rectangle {
                                id: container_18

                                height: 248
                                width: 248

                                clip: true
                                color: "transparent"
                                radius: 2

                                Image {
                                    id: aB6AXuCe9dGNQ3iFLMUpId7rDo6T0IpP0i_py4_Bp10wJbQK

                                    clip: true
                                    source: Qt.resolvedUrl("assets/aB6AXuCe9dGNQ3iFLMUpId7rDo6T0IpP0i_py4_Bp10wJbQK.png")
                                }
                                Rectangle {
                                    id: background_6

                                    x: 153.64
                                    y: 16

                                    height: 23
                                    width: 78.36

                                    color: "#fabd00"
                                    radius: 2

                                    Text {
                                        id: _text_12

                                        x: 8
                                        y: 4

                                        height: 15
                                        width: 64

                                        color: "#3f2e00"
                                        font.family: "Inter"
                                        font.pixelSize: 10
                                        font.weight: Font.Bold
                                        horizontalAlignment: Text.AlignLeft
                                        lineHeight: 15
                                        lineHeightMode: Text.FixedHeight
                                        text: "BESTSELLER"
                                        textFormat: Text.PlainText
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                    }
                                }
                            }
                        }
                    }
                    Rectangle {
                        id: product_Card_1

                        x: 312

                        height: 464
                        width: 280

                        color: "#1c1b1b"
                        radius: 4

                        Rectangle {
                            id: container_19

                            x: 16
                            y: 288

                            height: 96
                            width: 248

                            color: "transparent"

                            Rectangle {
                                id: heading_7

                                height: 28
                                width: 248

                                color: "transparent"

                                Text {
                                    id: atom_Air_13

                                    height: 28
                                    width: 249

                                    color: "#e5e2e1"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 18
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 28
                                    lineHeightMode: Text.FixedHeight
                                    text: "Atom Air 13"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_20

                                y: 32

                                height: 20
                                width: 248

                                color: "transparent"

                                Text {
                                    id: m3_Ultra_32GB_RAM_512GB

                                    height: 20
                                    width: 249

                                    color: "#9cf0ff"
                                    font.family: "Inter"
                                    font.pixelSize: 14
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 20
                                    lineHeightMode: Text.FixedHeight
                                    text: "M3 Ultra • 32GB RAM • 512GB"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_21

                                y: 56

                                height: 40
                                width: 248

                                color: "transparent"

                                Text {
                                    id: element_1

                                    y: 12

                                    height: 28
                                    width: 249

                                    color: "#ffffff"
                                    font.family: "Inter"
                                    font.pixelSize: 20
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 28
                                    lineHeightMode: Text.FixedHeight
                                    text: "$1,699.00"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Rectangle {
                            id: button_margin_2

                            x: 16
                            y: 384

                            height: 64
                            width: 248

                            color: "transparent"

                            Shape {
                                id: button_3

                                y: 24

                                height: 40
                                width: 248

                                ShapePath {
                                    id: button_3ShapePath

                                    strokeColor: "#000"
                                    strokeWidth: 0

                                    fillGradient: LinearGradient {
                                        id: gradientNode_1
                                    
                                        x1: button_3.width * 0.4746450446913303
                                        x2: button_3.width * 0.5253549837816488
                                        y1: button_3.height * 1.4746450446913304
                                        y2: button_3.height * -0.4746450162183513
                                    
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
                                        id: button_3PathRectangle

                                        x: 0
                                        y: 0

                                        height: button_3.height
                                        width: button_3.width

                                        radius: 12
                                    }
                                }
                                Text {
                                    id: _text_13

                                    x: 74.41
                                    y: 12

                                    height: 16
                                    width: 102

                                    color: "#3f2e00"
                                    font.capitalization: Font.AllUppercase
                                    font.family: "Inter"
                                    font.letterSpacing: 1.20
                                    font.pixelSize: 12
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignHCenter
                                    lineHeight: 16
                                    lineHeightMode: Text.FixedHeight
                                    text: "View Details"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Rectangle {
                            id: _margin_4

                            x: 16
                            y: 16

                            height: 272
                            width: 248

                            color: "transparent"

                            Rectangle {
                                id: container_22

                                height: 248
                                width: 248

                                clip: true
                                color: "transparent"
                                radius: 2

                                Image {
                                    id: aB6AXuBTXckaz2Y0Ry_1Z8Mk3mWeZvLhPGILiTlkcNUjALSX

                                    clip: true
                                    source: Qt.resolvedUrl("assets/aB6AXuBTXckaz2Y0Ry_1Z8Mk3mWeZvLhPGILiTlkcNUjALSX.png")
                                }
                            }
                        }
                    }
                    Rectangle {
                        id: product_Card_2

                        x: 624

                        height: 464
                        width: 280

                        color: "#1c1b1b"
                        radius: 4

                        Rectangle {
                            id: container_23

                            x: 16
                            y: 288

                            height: 96
                            width: 248

                            color: "transparent"

                            Rectangle {
                                id: heading_8

                                height: 28
                                width: 248

                                color: "transparent"

                                Text {
                                    id: monolith_Tower_Core

                                    height: 28
                                    width: 249

                                    color: "#e5e2e1"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 18
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 28
                                    lineHeightMode: Text.FixedHeight
                                    text: "Monolith Tower Core"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_24

                                y: 32

                                height: 20
                                width: 248

                                color: "transparent"

                                Text {
                                    id: rTX_5090_Liquid_Cooled_AI_Ready

                                    height: 20
                                    width: 249

                                    color: "#9cf0ff"
                                    font.family: "Inter"
                                    font.pixelSize: 14
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 20
                                    lineHeightMode: Text.FixedHeight
                                    text: "RTX 5090 • Liquid Cooled • AI Ready"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_25

                                y: 56

                                height: 40
                                width: 248

                                color: "transparent"

                                Text {
                                    id: element_2

                                    y: 12

                                    height: 28
                                    width: 249

                                    color: "#ffffff"
                                    font.family: "Inter"
                                    font.pixelSize: 20
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 28
                                    lineHeightMode: Text.FixedHeight
                                    text: "$5,999.00"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Rectangle {
                            id: button_margin_3

                            x: 16
                            y: 384

                            height: 64
                            width: 248

                            color: "transparent"

                            Shape {
                                id: button_4

                                y: 24

                                height: 40
                                width: 248

                                ShapePath {
                                    id: button_4ShapePath

                                    strokeColor: "#000"
                                    strokeWidth: 0

                                    fillGradient: LinearGradient {
                                        id: gradientNode_2
                                    
                                        x1: button_4.width * 0.4746450446913303
                                        x2: button_4.width * 0.5253549837816488
                                        y1: button_4.height * 1.4746450446913304
                                        y2: button_4.height * -0.4746450162183513
                                    
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
                                        id: button_4PathRectangle

                                        x: 0
                                        y: 0

                                        height: button_4.height
                                        width: button_4.width

                                        radius: 12
                                    }
                                }
                                Text {
                                    id: _text_14

                                    x: 74.41
                                    y: 12

                                    height: 16
                                    width: 102

                                    color: "#3f2e00"
                                    font.capitalization: Font.AllUppercase
                                    font.family: "Inter"
                                    font.letterSpacing: 1.20
                                    font.pixelSize: 12
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignHCenter
                                    lineHeight: 16
                                    lineHeightMode: Text.FixedHeight
                                    text: "View Details"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Rectangle {
                            id: _margin_5

                            x: 16
                            y: 16

                            height: 272
                            width: 248

                            color: "transparent"

                            Rectangle {
                                id: container_26

                                height: 248
                                width: 248

                                clip: true
                                color: "transparent"
                                radius: 2

                                Image {
                                    id: aB6AXuC6jCo2AXN_Z2KtBSnnNVNzUYPLkWHKfczzG7RcrSRV

                                    clip: true
                                    source: Qt.resolvedUrl("assets/aB6AXuC6jCo2AXN_Z2KtBSnnNVNzUYPLkWHKfczzG7RcrSRV.png")
                                }
                            }
                        }
                    }
                    Rectangle {
                        id: product_Card_3

                        x: 936

                        height: 464
                        width: 280

                        color: "#1c1b1b"
                        radius: 4

                        Rectangle {
                            id: container_27

                            x: 16
                            y: 288

                            height: 96
                            width: 248

                            color: "transparent"

                            Rectangle {
                                id: heading_9

                                height: 28
                                width: 248

                                color: "transparent"

                                Text {
                                    id: carbon_Shadow_Edition

                                    height: 28
                                    width: 249

                                    color: "#e5e2e1"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 18
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 28
                                    lineHeightMode: Text.FixedHeight
                                    text: "Carbon Shadow Edition"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_28

                                y: 32

                                height: 20
                                width: 248

                                color: "transparent"

                                Text {
                                    id: titanium_Chassis_OLED_120Hz

                                    height: 20
                                    width: 249

                                    color: "#9cf0ff"
                                    font.family: "Inter"
                                    font.pixelSize: 14
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 20
                                    lineHeightMode: Text.FixedHeight
                                    text: "Titanium Chassis • OLED 120Hz"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_29

                                y: 56

                                height: 40
                                width: 248

                                color: "transparent"

                                Text {
                                    id: element_3

                                    y: 12

                                    height: 28
                                    width: 249

                                    color: "#ffffff"
                                    font.family: "Inter"
                                    font.pixelSize: 20
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 28
                                    lineHeightMode: Text.FixedHeight
                                    text: "$2,899.00"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Rectangle {
                            id: button_margin_4

                            x: 16
                            y: 384

                            height: 64
                            width: 248

                            color: "transparent"

                            Shape {
                                id: button_5

                                y: 24

                                height: 40
                                width: 248

                                ShapePath {
                                    id: button_5ShapePath

                                    strokeColor: "#000"
                                    strokeWidth: 0

                                    fillGradient: LinearGradient {
                                        id: gradientNode_3
                                    
                                        x1: button_5.width * 0.4746450446913303
                                        x2: button_5.width * 0.5253549837816488
                                        y1: button_5.height * 1.4746450446913304
                                        y2: button_5.height * -0.4746450162183513
                                    
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
                                        id: button_5PathRectangle

                                        x: 0
                                        y: 0

                                        height: button_5.height
                                        width: button_5.width

                                        radius: 12
                                    }
                                }
                                Text {
                                    id: _text_15

                                    x: 74.41
                                    y: 12

                                    height: 16
                                    width: 102

                                    color: "#3f2e00"
                                    font.capitalization: Font.AllUppercase
                                    font.family: "Inter"
                                    font.letterSpacing: 1.20
                                    font.pixelSize: 12
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignHCenter
                                    lineHeight: 16
                                    lineHeightMode: Text.FixedHeight
                                    text: "View Details"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Rectangle {
                            id: _margin_6

                            x: 16
                            y: 16

                            height: 272
                            width: 248

                            color: "transparent"

                            Rectangle {
                                id: container_30

                                height: 248
                                width: 248

                                clip: true
                                color: "transparent"
                                radius: 2

                                Image {
                                    id: aB6AXuA45qft3S67wxlaykfg9hmnR7k4Z4jgXN8ERA5BAZPR

                                    clip: true
                                    source: Qt.resolvedUrl("assets/aB6AXuA45qft3S67wxlaykfg9hmnR7k4Z4jgXN8ERA5BAZPR.png")
                                }
                            }
                        }
                    }
                }
            }
            Rectangle {
                id: category_Audio

                x: 32
                y: 620

                height: 460
                width: 1216

                color: "transparent"

                Rectangle {
                    id: container_31

                    height: 36
                    width: 1216

                    color: "transparent"

                    Rectangle {
                        id: heading_10

                        height: 36
                        width: 208.13

                        color: "transparent"

                        Text {
                            id: _text_16

                            height: 36
                            width: 210

                            color: "#e5e2e1"
                            font.family: "Space Grotesk"
                            font.pixelSize: 30
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 36
                            lineHeightMode: Text.FixedHeight
                            text: "Sonic Mastery"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: _margin_7

                        x: 208.13
                        y: 17.50

                        height: 1
                        width: 1007.87

                        color: "transparent"

                        Rectangle {
                            id: horizontal_Divider_1

                            x: 16

                            height: 1
                            width: 991.87

                            color: "#33414755"
                        }
                    }
                }
                Rectangle {
                    id: container_32

                    y: 76

                    height: 384
                    width: 1216

                    color: "transparent"

                    Rectangle {
                        id: audio_Product_1

                        height: 384
                        width: 384

                        clip: true
                        color: "transparent"
                        radius: 4

                        Image {
                            id: aB6AXuB58q7OuOoaaRPsuMmLHVph3hmUB4dAodfGp70x7dLH

                            clip: true
                            source: Qt.resolvedUrl("assets/aB6AXuB58q7OuOoaaRPsuMmLHVph3hmUB4dAodfGp70x7dLH.png")
                        }
                        Shape {
                            id: background_7

                            height: 384
                            width: 384

                            ShapePath {
                                id: background_7ShapePath

                                strokeColor: "#000"
                                strokeWidth: 0

                                fillGradient: LinearGradient {
                                    id: gradientNode_4
                                
                                    x1: background_7.width * 0.49999999999999994
                                    x2: background_7.width * 0.5000000000000001
                                    y1: background_7.height * 1
                                    y2: background_7.height * 0
                                
                                    GradientStop {
                                        color: "#ff131313"
                                        position: 0
                                    }
                                    GradientStop {
                                        color: "#66131313"
                                        position: 0.50
                                    }
                                    GradientStop {
                                        color: "#00131313"
                                        position: 1
                                    }
                                }

                                PathRectangle {
                                    id: background_7PathRectangle

                                    x: 0
                                    y: 0

                                    height: background_7.height
                                    width: background_7.width
                                }
                            }
                            Rectangle {
                                id: heading_11

                                x: 32
                                y: 244

                                height: 32
                                width: 320

                                color: "transparent"

                                Text {
                                    id: echo_X_Studio

                                    height: 32
                                    width: 321

                                    color: "#e5e2e1"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 24
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 32
                                    lineHeightMode: Text.FixedHeight
                                    text: "Echo-X Studio"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: _margin_8

                                x: 32
                                y: 276

                                height: 48
                                width: 320

                                color: "transparent"

                                Rectangle {
                                    id: container_33

                                    height: 24
                                    width: 320

                                    color: "transparent"

                                    Text {
                                        id: pure_silence_Absolute_fidelity_

                                        height: 24
                                        width: 321

                                        color: "#c1c6d7"
                                        font.family: "Inter"
                                        font.italic: true
                                        font.pixelSize: 16
                                        font.weight: Font.Normal
                                        horizontalAlignment: Text.AlignLeft
                                        lineHeight: 24
                                        lineHeightMode: Text.FixedHeight
                                        text: "Pure silence. Absolute fidelity."
                                        textFormat: Text.PlainText
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                    }
                                }
                            }
                            Rectangle {
                                id: container_34

                                x: 32
                                y: 324

                                height: 28
                                width: 320

                                color: "transparent"

                                Rectangle {
                                    id: container_35

                                    height: 28
                                    width: 85.09

                                    color: "transparent"

                                    Text {
                                        id: _text_17

                                        height: 28
                                        width: 87

                                        color: "#e5e2e1"
                                        font.family: "Inter"
                                        font.pixelSize: 20
                                        font.weight: Font.Bold
                                        horizontalAlignment: Text.AlignLeft
                                        lineHeight: 28
                                        lineHeightMode: Text.FixedHeight
                                        text: "$499.00"
                                        textFormat: Text.PlainText
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                                Rectangle {
                                    id: button_6

                                    x: 207.67
                                    y: 2

                                    height: 24
                                    width: 112.33

                                    color: "transparent"

                                    Rectangle {
                                        id: container_36

                                        height: 24
                                        width: 96.94

                                        color: "transparent"

                                        Text {
                                            id: _text_18

                                            height: 24
                                            width: 98

                                            color: "#fabd00"
                                            font.family: "Inter"
                                            font.pixelSize: 16
                                            font.weight: Font.Bold
                                            horizontalAlignment: Text.AlignHCenter
                                            lineHeight: 24
                                            lineHeightMode: Text.FixedHeight
                                            text: "View Details"
                                            textFormat: Text.PlainText
                                            verticalAlignment: Text.AlignVCenter
                                            wrapMode: Text.Wrap
                                        }
                                    }
                                    Rectangle {
                                        id: _margin_9

                                        x: 96.93
                                        y: 6

                                        height: 12
                                        width: 15.40

                                        color: "transparent"

                                        Rectangle {
                                            id: container_37

                                            x: 8

                                            height: 12
                                            width: 7.40

                                            color: "transparent"

                                            Image {
                                                id: icon_2

                                                source: Qt.resolvedUrl("assets/icon_13.png")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Rectangle {
                        id: audio_Product_2

                        x: 416

                        height: 384
                        width: 384

                        clip: true
                        color: "transparent"
                        radius: 4

                        Image {
                            id: aB6AXuDdQPbUzwK6K4mPZszAzN7SkqHZLGmyS0EmRJ92pXMv

                            clip: true
                            source: Qt.resolvedUrl("assets/aB6AXuDdQPbUzwK6K4mPZszAzN7SkqHZLGmyS0EmRJ92pXMv.png")
                        }
                        Shape {
                            id: background_8

                            height: 384
                            width: 384

                            ShapePath {
                                id: background_8ShapePath

                                strokeColor: "#000"
                                strokeWidth: 0

                                fillGradient: LinearGradient {
                                    id: gradientNode_5
                                
                                    x1: background_8.width * 0.49999999999999994
                                    x2: background_8.width * 0.5000000000000001
                                    y1: background_8.height * 1
                                    y2: background_8.height * 0
                                
                                    GradientStop {
                                        color: "#ff131313"
                                        position: 0
                                    }
                                    GradientStop {
                                        color: "#66131313"
                                        position: 0.50
                                    }
                                    GradientStop {
                                        color: "#00131313"
                                        position: 1
                                    }
                                }

                                PathRectangle {
                                    id: background_8PathRectangle

                                    x: 0
                                    y: 0

                                    height: background_8.height
                                    width: background_8.width
                                }
                            }
                            Rectangle {
                                id: heading_12

                                x: 32
                                y: 244

                                height: 32
                                width: 320

                                color: "transparent"

                                Text {
                                    id: cylinder_One

                                    height: 32
                                    width: 321

                                    color: "#e5e2e1"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 24
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 32
                                    lineHeightMode: Text.FixedHeight
                                    text: "Cylinder One"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: _margin_10

                                x: 32
                                y: 276

                                height: 48
                                width: 320

                                color: "transparent"

                                Rectangle {
                                    id: container_38

                                    height: 24
                                    width: 320

                                    color: "transparent"

                                    Text {
                                        id: omnidirectional_Pulse_

                                        height: 24
                                        width: 321

                                        color: "#c1c6d7"
                                        font.family: "Inter"
                                        font.italic: true
                                        font.pixelSize: 16
                                        font.weight: Font.Normal
                                        horizontalAlignment: Text.AlignLeft
                                        lineHeight: 24
                                        lineHeightMode: Text.FixedHeight
                                        text: "360° Omnidirectional Pulse."
                                        textFormat: Text.PlainText
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                    }
                                }
                            }
                            Rectangle {
                                id: container_39

                                x: 32
                                y: 324

                                height: 28
                                width: 320

                                color: "transparent"

                                Rectangle {
                                    id: container_40

                                    height: 28
                                    width: 84.09

                                    color: "transparent"

                                    Text {
                                        id: _text_19

                                        height: 28
                                        width: 86

                                        color: "#e5e2e1"
                                        font.family: "Inter"
                                        font.pixelSize: 20
                                        font.weight: Font.Bold
                                        horizontalAlignment: Text.AlignLeft
                                        lineHeight: 28
                                        lineHeightMode: Text.FixedHeight
                                        text: "$329.00"
                                        textFormat: Text.PlainText
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                }
                                Rectangle {
                                    id: button_7

                                    x: 207.67
                                    y: 2

                                    height: 24
                                    width: 112.33

                                    color: "transparent"

                                    Rectangle {
                                        id: container_41

                                        height: 24
                                        width: 96.94

                                        color: "transparent"

                                        Text {
                                            id: _text_20

                                            height: 24
                                            width: 98

                                            color: "#fabd00"
                                            font.family: "Inter"
                                            font.pixelSize: 16
                                            font.weight: Font.Bold
                                            horizontalAlignment: Text.AlignHCenter
                                            lineHeight: 24
                                            lineHeightMode: Text.FixedHeight
                                            text: "View Details"
                                            textFormat: Text.PlainText
                                            verticalAlignment: Text.AlignVCenter
                                            wrapMode: Text.Wrap
                                        }
                                    }
                                    Rectangle {
                                        id: _margin_11

                                        x: 96.93
                                        y: 6

                                        height: 12
                                        width: 15.40

                                        color: "transparent"

                                        Rectangle {
                                            id: container_42

                                            x: 8

                                            height: 12
                                            width: 7.40

                                            color: "transparent"

                                            Image {
                                                id: icon_3

                                                source: Qt.resolvedUrl("assets/icon_14.png")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Rectangle {
                        id: audio_Product_3

                        x: 832

                        height: 384
                        width: 384

                        clip: true
                        color: "transparent"
                        radius: 4

                        Image {
                            id: aB6AXuD_RhDfG_BKUoSCxgDWbVef51uYkubbFN3VOtKsFg6M

                            clip: true
                            source: Qt.resolvedUrl("assets/aB6AXuD_RhDfG_BKUoSCxgDWbVef51uYkubbFN3VOtKsFg6M.png")
                        }
                        Shape {
                            id: background_9

                            height: 384
                            width: 384

                            ShapePath {
                                id: background_9ShapePath

                                strokeColor: "#000"
                                strokeWidth: 0

                                fillGradient: LinearGradient {
                                    id: gradientNode_6
                                
                                    x1: background_9.width * 0.49999999999999994
                                    x2: background_9.width * 0.5000000000000001
                                    y1: background_9.height * 1
                                    y2: background_9.height * 0
                                
                                    GradientStop {
                                        color: "#ff131313"
                                        position: 0
                                    }
                                    GradientStop {
                                        color: "#66131313"
                                        position: 0.50
                                    }
                                    GradientStop {
                                        color: "#00131313"
                                        position: 1
                                    }
                                }

                                PathRectangle {
                                    id: background_9PathRectangle

                                    x: 0
                                    y: 0

                                    height: background_9.height
                                    width: background_9.width
                                }
                            }
                            Rectangle {
                                id: heading_13

                                x: 32
                                y: 244

                                height: 32
                                width: 320

                                color: "transparent"

                                Text {
                                    id: nova_Buds

                                    height: 32
                                    width: 321

                                    color: "#e5e2e1"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 24
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 32
                                    lineHeightMode: Text.FixedHeight
                                    text: "Nova Buds"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: _margin_12

                                x: 32
                                y: 276

                                height: 48
                                width: 320

                                color: "transparent"

                                Rectangle {
                                    id: container_43

                                    height: 24
                                    width: 320

                                    color: "transparent"

                                    Text {
                                        id: gravity_defying_comfort_

                                        height: 24
                                        width: 321

                                        color: "#c1c6d7"
                                        font.family: "Inter"
                                        font.italic: true
                                        font.pixelSize: 16
                                        font.weight: Font.Normal
                                        horizontalAlignment: Text.AlignLeft
                                        lineHeight: 24
                                        lineHeightMode: Text.FixedHeight
                                        text: "Gravity-defying comfort."
                                        textFormat: Text.PlainText
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                    }
                                }
                            }
                            Rectangle {
                                id: container_44

                                x: 32
                                y: 324

                                height: 28
                                width: 320

                                color: "transparent"

                                Rectangle {
                                    id: container_45

                                    height: 28
                                    width: 80.19

                                    color: "transparent"

                                    Text {
                                        id: _text_21

                                        height: 28
                                        width: 82

                                        color: "#e5e2e1"
                                        font.family: "Inter"
                                        font.pixelSize: 20
                                        font.weight: Font.Bold
                                        horizontalAlignment: Text.AlignLeft
                                        lineHeight: 28
                                        lineHeightMode: Text.FixedHeight
                                        text: "$199.00"
                                        textFormat: Text.PlainText
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                    }
                                }
                                Rectangle {
                                    id: button_8

                                    x: 207.67
                                    y: 2

                                    height: 24
                                    width: 112.33

                                    color: "transparent"

                                    Rectangle {
                                        id: container_46

                                        height: 24
                                        width: 96.94

                                        color: "transparent"

                                        Text {
                                            id: _text_22

                                            height: 24
                                            width: 98

                                            color: "#fabd00"
                                            font.family: "Inter"
                                            font.pixelSize: 16
                                            font.weight: Font.Bold
                                            horizontalAlignment: Text.AlignHCenter
                                            lineHeight: 24
                                            lineHeightMode: Text.FixedHeight
                                            text: "View Details"
                                            textFormat: Text.PlainText
                                            verticalAlignment: Text.AlignVCenter
                                            wrapMode: Text.Wrap
                                        }
                                    }
                                    Rectangle {
                                        id: _margin_13

                                        x: 96.93
                                        y: 6

                                        height: 12
                                        width: 15.40

                                        color: "transparent"

                                        Rectangle {
                                            id: container_47

                                            x: 8

                                            height: 12
                                            width: 7.40

                                            color: "transparent"

                                            Image {
                                                id: icon_4

                                                source: Qt.resolvedUrl("assets/icon_15.png")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    Rectangle {
        id: footer

        y: 2038

        height: 285
        width: 1280

        color: "#0a0a0a"

        Rectangle {
            id: container_48

            y: 80

            height: 165
            width: 1280

            color: "transparent"

            Text {
                id: _text_23

                x: 558.29

                height: 28
                width: 167

                color: "#f5f5f5"
                font.capitalization: Font.AllUppercase
                font.family: "Space Grotesk"
                font.letterSpacing: 1.80
                font.pixelSize: 18
                font.weight: Font.Bold
                horizontalAlignment: Text.AlignHCenter
                lineHeight: 28
                lineHeightMode: Text.FixedHeight
                text: "NEON MONOLITH"
                textFormat: Text.PlainText
                verticalAlignment: Text.AlignVCenter
            }
            Rectangle {
                id: _margin_14

                x: 246.18
                y: 28

                height: 52
                width: 787.65

                color: "transparent"

                Rectangle {
                    id: container_49

                    y: 32

                    height: 20
                    width: 787.65

                    color: "transparent"

                    Rectangle {
                        id: link

                        height: 20
                        width: 92.58

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_24

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
                        id: link_1

                        x: 140.58

                        height: 20
                        width: 112.77

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_25

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
                        id: link_2

                        x: 301.35

                        height: 20
                        width: 108.80

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_26

                            height: 20
                            width: 110

                            color: "#737373"
                            font.family: "Inter"
                            font.pixelSize: 14
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
                        id: link_3

                        x: 458.15

                        height: 20
                        width: 58.05

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_27

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
                        id: link_4

                        x: 564.20

                        height: 20
                        width: 50.98

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_28

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
                        id: link_5

                        x: 663.18

                        height: 20
                        width: 124.47

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_29

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
                id: _margin_15

                x: 16
                y: 80

                height: 85
                width: 1248

                color: "transparent"

                Image {
                    id: horizontalBorder

                    y: 32

                    source: Qt.resolvedUrl("assets/horizontalBorder_4.png")

                    Rectangle {
                        id: container_50

                        y: 33

                        height: 20
                        width: 400.91

                        color: "transparent"

                        Text {
                            id: _text_30

                            height: 20
                            width: 402

                            color: "#737373"
                            font.family: "Inter"
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            text: "© 2024 NEON MONOLITH. ENGINEERED FOR HAUTE TECH."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: container_51

                        x: 1146
                        y: 33

                        height: 20
                        width: 102

                        color: "transparent"

                        Rectangle {
                            id: container_52

                            height: 20
                            width: 20

                            color: "transparent"

                            Image {
                                id: icon_5

                                source: Qt.resolvedUrl("assets/icon_16.png")
                            }
                        }
                        Rectangle {
                            id: _margin_16

                            x: 20

                            height: 20
                            width: 42

                            color: "transparent"

                            Rectangle {
                                id: container_53

                                x: 24

                                height: 20
                                width: 18

                                color: "transparent"

                                Image {
                                    id: icon_6

                                    source: Qt.resolvedUrl("assets/icon_17.png")
                                }
                            }
                        }
                        Rectangle {
                            id: _margin_17

                            x: 62

                            height: 20
                            width: 40

                            color: "transparent"

                            Rectangle {
                                id: container_54

                                x: 24

                                height: 20
                                width: 16

                                color: "transparent"

                                Image {
                                    id: icon_7

                                    source: Qt.resolvedUrl("assets/icon_18.png")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    Image {
        id: topNavBar

        source: Qt.resolvedUrl("assets/topNavBar_1.png")
    }
}