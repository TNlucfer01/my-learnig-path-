import QtQuick
import QtQuick.Shapes

Rectangle {
    id: home_Page

    height: 3495
    width: 1280

    color: "#131313"

    Rectangle {
        id: main

        height: 3206
        width: 1280

        color: "transparent"

        Rectangle {
            id: hero_Section

            y: 80

            height: 960.50
            width: 1280

            clip: true
            color: "transparent"

            Rectangle {
                id: container

                height: 961
                width: 1280

                color: "transparent"

                Image {
                    id: premium_Headphones

                    clip: true
                    source: Qt.resolvedUrl("assets/premium_Headphones.png")
                }
                Shape {
                    id: gradient

                    height: 961
                    width: 1280

                    ShapePath {
                        id: gradientShapePath

                        strokeColor: "#000"
                        strokeWidth: 0

                        fillGradient: LinearGradient {
                            id: gradientNode
                        
                            x1: gradient.width * 0
                            x2: gradient.width * 1
                            y1: gradient.height * 0.49999999999999994
                            y2: gradient.height * 0.49999999999999994
                        
                            GradientStop {
                                color: "#ff131313"
                                position: 0
                            }
                            GradientStop {
                                color: "#cc131313"
                                position: 0.50
                            }
                            GradientStop {
                                color: "#00131313"
                                position: 1
                            }
                        }

                        PathRectangle {
                            id: gradientPathRectangle

                            x: 0
                            y: 0

                            height: gradient.height
                            width: gradient.width
                        }
                    }
                }
            }
            Rectangle {
                id: floating_Asymmetric_Element

                x: 853.34
                y: 480.25

                height: 640.31
                width: 426.66

                color: "transparent"

                Rectangle {
                    id: container_1

                    height: 640.31
                    width: 426.66

                    color: "transparent"

                    Image {
                        id: overlay_Blur

                        x: -120
                        y: -120

                        source: Qt.resolvedUrl("assets/overlay_Blur_1.png")
                    }
                    Image {
                        id: smartphone_flagship

                        x: -35

                        clip: true
                        source: Qt.resolvedUrl("assets/smartphone_flagship.png")
                    }
                }
            }
            Rectangle {
                id: container_2

                x: 80
                y: 251.50

                height: 457.50
                width: 566.47

                color: "transparent"

                Rectangle {
                    id: container_3

                    height: 263.50
                    width: 566.47

                    color: "transparent"

                    Text {
                        id: _text

                        height: 16
                        width: 190

                        color: "#bdf4ff"
                        font.capitalization: Font.AllUppercase
                        font.family: "Inter"
                        font.letterSpacing: 2.40
                        font.pixelSize: 12
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 16
                        lineHeightMode: Text.FixedHeight
                        text: "The Future of Sound"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                    Rectangle {
                        id: heading_1

                        y: 32.50

                        height: 231
                        width: 566.47

                        color: "transparent"

                        Image {
                            id: bEYOND_ACOUSTICS_

                            source: Qt.resolvedUrl("assets/bEYOND_ACOUSTICS_.png")
                        }
                    }
                }
                Rectangle {
                    id: container_4

                    y: 295.50

                    height: 56
                    width: 566.47

                    color: "transparent"

                    Text {
                        id: _text_1

                        height: 56
                        width: 568

                        color: "#c1c6d7"
                        font.family: "Inter"
                        font.pixelSize: 20
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 28
                        lineHeightMode: Text.FixedHeight
                        text: "Engineered for the elite. Experience a soundstage so vast, it\nredefines the very fabric of digital immersion."
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: container_5

                    y: 383.50

                    height: 74
                    width: 566.47

                    color: "transparent"

                    Shape {
                        id: button

                        y: 16

                        height: 58
                        width: 159.53

                        ShapePath {
                            id: buttonShapePath

                            strokeColor: "#000"
                            strokeWidth: 0

                            fillGradient: LinearGradient {
                                id: gradientNode_1
                            
                                x1: button.width * 0.38325047898499476
                                x2: button.width * 0.6167495413810958
                                y1: button.height * -0.38325047898499476
                                y2: button.height * 1.383250458618904
                            
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
                                id: buttonPathRectangle

                                x: 0
                                y: 0

                                height: button.height
                                width: button.width

                                radius: 9999
                            }
                        }
                        Image {
                            id: button_shadow

                            x: -20
                            y: -10

                            source: Qt.resolvedUrl("assets/button_shadow.png")
                        }
                        Text {
                            id: _text_2

                            x: 40
                            y: 17

                            height: 24
                            width: 81

                            color: "#3f2e00"
                            font.family: "Inter"
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 24
                            lineHeightMode: Text.FixedHeight
                            text: "Shop Now"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: button_1

                        x: 175.53
                        y: 16

                        height: 58
                        width: 228.67

                        border.color: "#338b90a0"
                        border.width: 1
                        color: "transparent"
                        radius: 9999

                        Text {
                            id: _text_3

                            x: 41
                            y: 17

                            height: 24
                            width: 148

                            color: "#e5e2e1"
                            font.family: "Inter"
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 24
                            lineHeightMode: Text.FixedHeight
                            text: "Explore Showroom"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }
        Rectangle {
            id: section_New_Arrivals_Bento_Grid

            y: 1001

            height: 1136.50
            width: 1280

            color: "#1c1b1b"

            Rectangle {
                id: container_6

                x: 80
                y: 96

                height: 80.50
                width: 1120

                color: "transparent"

                Rectangle {
                    id: paragraph

                    height: 80.50
                    width: 315.56

                    color: "transparent"

                    Text {
                        id: _text_4

                        height: 16
                        width: 153

                        color: "#9cf0ff"
                        font.capitalization: Font.AllUppercase
                        font.family: "Inter"
                        font.letterSpacing: 1.20
                        font.pixelSize: 12
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 16
                        lineHeightMode: Text.FixedHeight
                        text: "Latest Engineering"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                    Text {
                        id: heading_2_NEW_ARRIVALS

                        y: 32.50

                        height: 48
                        width: 316

                        color: "#e5e2e1"
                        font.family: "Space Grotesk"
                        font.letterSpacing: -1.20
                        font.pixelSize: 48
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 48
                        lineHeightMode: Text.FixedHeight
                        text: "NEW ARRIVALS"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                Image {
                    id: link

                    x: 973.36
                    y: 51.50

                    source: Qt.resolvedUrl("assets/link.png")

                    Text {
                        id: _text_5

                        height: 24
                        width: 148

                        color: "#fabd00"
                        font.family: "Inter"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 24
                        lineHeightMode: Text.FixedHeight
                        text: "View All Collection"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
            }
            Rectangle {
                id: container_7

                x: 80
                y: 240.50

                height: 800
                width: 1120

                color: "transparent"

                Rectangle {
                    id: main_Feature_Card

                    height: 800
                    width: 552

                    clip: true
                    color: "#201f1f"
                    radius: 4

                    Image {
                        id: pro_Audio

                        clip: true
                        source: Qt.resolvedUrl("assets/pro_Audio.png")
                    }
                    Shape {
                        id: gradient_1

                        height: 800
                        width: 552

                        ShapePath {
                            id: gradient_1ShapePath

                            strokeColor: "#000"
                            strokeWidth: 0

                            fillGradient: LinearGradient {
                                id: gradientNode_2
                            
                                x1: gradient_1.width * 0.4999999999999999
                                x2: gradient_1.width * 0.5
                                y1: gradient_1.height * 0.9999999999999999
                                y2: gradient_1.height * 0
                            
                                GradientStop {
                                    color: "#cc000000"
                                    position: 0
                                }
                                GradientStop {
                                    color: "#00000000"
                                    position: 0.50
                                }
                                GradientStop {
                                    color: "#00000000"
                                    position: 1
                                }
                            }

                            PathRectangle {
                                id: gradient_1PathRectangle

                                x: 0
                                y: 0

                                height: gradient_1.height
                                width: gradient_1.width
                            }
                        }
                    }
                    Rectangle {
                        id: container_8

                        y: 549

                        height: 251
                        width: 457.94

                        color: "transparent"

                        Rectangle {
                            id: background

                            x: 40
                            y: 37

                            height: 20
                            width: 126.88

                            color: "#00e3fd"
                            radius: 2

                            Text {
                                id: _text_6

                                x: 12
                                y: 2.50

                                height: 15
                                width: 104

                                color: "#00616d"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.pixelSize: 10
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 15
                                lineHeightMode: Text.FixedHeight
                                text: "Exclusive Release"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: heading_3

                            x: 40
                            y: 71

                            height: 36
                            width: 377.94

                            color: "transparent"

                            Text {
                                id: _text_7

                                height: 36
                                width: 246

                                color: "#e5e2e1"
                                font.family: "Space Grotesk"
                                font.pixelSize: 30
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 36
                                lineHeightMode: Text.FixedHeight
                                text: "MONOLITH PRO-X"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                        Rectangle {
                            id: container_9

                            x: 40
                            y: 121

                            height: 50
                            width: 377.94

                            color: "transparent"

                            Text {
                                id: _text_8

                                y: 2

                                height: 48
                                width: 379

                                color: "#c1c6d7"
                                font.family: "Inter"
                                font.pixelSize: 16
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 24
                                lineHeightMode: Text.FixedHeight
                                text: "The gold standard in noise-cancelling technology.\nRedefining silence."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: button_2

                            x: 40
                            y: 185

                            height: 26
                            width: 112.78

                            color: "transparent"

                            Text {
                                id: _text_9

                                y: 2

                                height: 24
                                width: 90

                                color: "#fabd00"
                                font.family: "Inter"
                                font.pixelSize: 16
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignHCenter
                                lineHeight: 24
                                lineHeightMode: Text.FixedHeight
                                text: "Learn More"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                            }
                            Rectangle {
                                id: container_10

                                x: 96.78
                                y: 6

                                height: 16
                                width: 16

                                color: "transparent"

                                Image {
                                    id: icon

                                    source: Qt.resolvedUrl("assets/icon_25.png")
                                }
                            }
                        }
                    }
                }
                Rectangle {
                    id: secondary_Card_1

                    x: 568

                    height: 392
                    width: 552

                    clip: true
                    color: "#201f1f"
                    radius: 4

                    Image {
                        id: gaming_Setup

                        clip: true
                        source: Qt.resolvedUrl("assets/gaming_Setup.png")
                    }
                    Shape {
                        id: gradient_2

                        height: 392
                        width: 552

                        ShapePath {
                            id: gradient_2ShapePath

                            strokeColor: "#000"
                            strokeWidth: 0

                            fillGradient: LinearGradient {
                                id: gradientNode_3
                            
                                x1: gradient_2.width * 0
                                x2: gradient_2.width * 1
                                y1: gradient_2.height * 0.5
                                y2: gradient_2.height * 0.5
                            
                                GradientStop {
                                    color: "#99000000"
                                    position: 0
                                }
                                GradientStop {
                                    color: "#00000000"
                                    position: 1
                                }
                            }

                            PathRectangle {
                                id: gradient_2PathRectangle

                                x: 0
                                y: 0

                                height: gradient_2.height
                                width: gradient_2.width
                            }
                        }
                    }
                    Rectangle {
                        id: container_11

                        height: 392
                        width: 215.30

                        color: "transparent"

                        Rectangle {
                            id: heading_4

                            x: 32
                            y: 136

                            height: 32
                            width: 151.30

                            color: "transparent"

                            Text {
                                id: _text_10

                                height: 32
                                width: 153

                                color: "#e5e2e1"
                                font.family: "Space Grotesk"
                                font.pixelSize: 24
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 32
                                lineHeightMode: Text.FixedHeight
                                text: "QUBIT SERIES"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: _margin

                            x: 32
                            y: 168

                            height: 52
                            width: 151.30

                            color: "transparent"

                            Rectangle {
                                id: container_12

                                y: 12

                                height: 40
                                width: 151.30

                                color: "transparent"

                                Text {
                                    id: next_gen_processing_power_

                                    height: 40
                                    width: 153

                                    color: "#c1c6d7"
                                    font.family: "Inter"
                                    font.pixelSize: 14
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 20
                                    lineHeightMode: Text.FixedHeight
                                    text: "Next-gen processing power."
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Rectangle {
                            id: _margin_1

                            x: 32
                            y: 220

                            height: 36
                            width: 151.30

                            color: "transparent"

                            Rectangle {
                                id: container_13

                                y: 12

                                height: 24
                                width: 151.30

                                color: "transparent"

                                Text {
                                    id: element

                                    height: 24
                                    width: 153

                                    color: "#9cf0ff"
                                    font.family: "Inter"
                                    font.pixelSize: 16
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 24
                                    lineHeightMode: Text.FixedHeight
                                    text: "$2,499.00"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                    }
                }
                Rectangle {
                    id: small_Card_1

                    x: 568
                    y: 408

                    height: 392
                    width: 268

                    clip: true
                    color: "#201f1f"
                    radius: 4

                    Image {
                        id: tablets

                        clip: true
                        source: Qt.resolvedUrl("assets/tablets.png")
                    }
                    Rectangle {
                        id: container_14

                        height: 392
                        width: 268

                        color: "transparent"

                        Rectangle {
                            id: heading_5

                            x: 24
                            y: 320

                            height: 28
                            width: 220

                            color: "transparent"

                            Text {
                                id: tAB_VULCAN

                                height: 28
                                width: 221

                                color: "#e5e2e1"
                                font.family: "Space Grotesk"
                                font.pixelSize: 20
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 28
                                lineHeightMode: Text.FixedHeight
                                text: "TAB VULCAN"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_15

                            x: 24
                            y: 348

                            height: 20
                            width: 220

                            color: "transparent"

                            Text {
                                id: explore

                                height: 20
                                width: 221

                                color: "#fabd00"
                                font.family: "Inter"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 20
                                lineHeightMode: Text.FixedHeight
                                text: "Explore"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
                Rectangle {
                    id: small_Card_2

                    x: 852
                    y: 408

                    height: 392
                    width: 268

                    clip: true
                    color: "#201f1f"
                    radius: 4

                    Image {
                        id: accessories

                        clip: true
                        source: Qt.resolvedUrl("assets/accessories.png")
                    }
                    Rectangle {
                        id: container_16

                        height: 392
                        width: 268

                        color: "transparent"

                        Rectangle {
                            id: heading_6

                            x: 24
                            y: 320

                            height: 28
                            width: 220

                            color: "transparent"

                            Text {
                                id: cHRONOS_II

                                height: 28
                                width: 221

                                color: "#e5e2e1"
                                font.family: "Space Grotesk"
                                font.pixelSize: 20
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 28
                                lineHeightMode: Text.FixedHeight
                                text: "CHRONOS II"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_17

                            x: 24
                            y: 348

                            height: 20
                            width: 220

                            color: "transparent"

                            Text {
                                id: pre_order

                                height: 20
                                width: 221

                                color: "#fabd00"
                                font.family: "Inter"
                                font.pixelSize: 14
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 20
                                lineHeightMode: Text.FixedHeight
                                text: "Pre-order"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            id: section_Tech_Stats_Info

            y: 2137

            height: 232
            width: 1280

            clip: true
            color: "#131313"

            Rectangle {
                id: container_18

                y: 80

                height: 72
                width: 1280

                color: "transparent"

                Rectangle {
                    id: container_19

                    x: 32

                    height: 72
                    width: 268

                    color: "transparent"

                    Rectangle {
                        id: container_20

                        height: 48
                        width: 268

                        color: "transparent"

                        Text {
                            id: _text_11

                            x: 106.97

                            height: 48
                            width: 53

                            color: "#fabd00"
                            font.family: "Space Grotesk"
                            font.letterSpacing: -2.40
                            font.pixelSize: 48
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 48
                            lineHeightMode: Text.FixedHeight
                            text: "8K"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Rectangle {
                        id: container_21

                        y: 56

                        height: 16
                        width: 268

                        color: "transparent"

                        Text {
                            id: _text_12

                            x: 51.04

                            height: 16
                            width: 170

                            color: "#9cf0ff"
                            font.capitalization: Font.AllUppercase
                            font.family: "Inter"
                            font.letterSpacing: 2.40
                            font.pixelSize: 12
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 16
                            lineHeightMode: Text.FixedHeight
                            text: "Native Resolution"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
                Rectangle {
                    id: container_22

                    x: 348

                    height: 72
                    width: 268

                    color: "transparent"

                    Rectangle {
                        id: paragraph_1

                        height: 48
                        width: 268

                        color: "transparent"

                        Text {
                            id: _text_13

                            x: 85.24

                            height: 48
                            width: 73

                            color: "#fabd00"
                            font.family: "Space Grotesk"
                            font.letterSpacing: -2.40
                            font.pixelSize: 48
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 48
                            lineHeightMode: Text.FixedHeight
                            text: "120"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                        Text {
                            id: _text_14

                            x: 159.37
                            y: 16

                            height: 32
                            width: 22

                            color: "#fabd00"
                            font.family: "Space Grotesk"
                            font.letterSpacing: -2.40
                            font.pixelSize: 24
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 32
                            lineHeightMode: Text.FixedHeight
                            text: "Hz"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Rectangle {
                        id: container_23

                        y: 56

                        height: 16
                        width: 268

                        color: "transparent"

                        Text {
                            id: _text_15

                            x: 75.54

                            height: 16
                            width: 121

                            color: "#9cf0ff"
                            font.capitalization: Font.AllUppercase
                            font.family: "Inter"
                            font.letterSpacing: 2.40
                            font.pixelSize: 12
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 16
                            lineHeightMode: Text.FixedHeight
                            text: "Refresh Rate"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
                Rectangle {
                    id: container_24

                    x: 664

                    height: 72
                    width: 268

                    color: "transparent"

                    Rectangle {
                        id: paragraph_2

                        height: 48
                        width: 268

                        color: "transparent"

                        Text {
                            id: _text_16

                            x: 91.44

                            height: 48
                            width: 56

                            color: "#fabd00"
                            font.family: "Space Grotesk"
                            font.letterSpacing: -2.40
                            font.pixelSize: 48
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 48
                            lineHeightMode: Text.FixedHeight
                            text: "0.1"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                        Text {
                            id: _text_17

                            x: 148.28
                            y: 16

                            height: 32
                            width: 27

                            color: "#fabd00"
                            font.family: "Space Grotesk"
                            font.letterSpacing: -2.40
                            font.pixelSize: 24
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 32
                            lineHeightMode: Text.FixedHeight
                            text: "ms"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Rectangle {
                        id: container_25

                        y: 56

                        height: 16
                        width: 268

                        color: "transparent"

                        Text {
                            id: _text_18

                            x: 70.04

                            height: 16
                            width: 132

                            color: "#9cf0ff"
                            font.capitalization: Font.AllUppercase
                            font.family: "Inter"
                            font.letterSpacing: 2.40
                            font.pixelSize: 12
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 16
                            lineHeightMode: Text.FixedHeight
                            text: "Input Latency"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
                Rectangle {
                    id: container_26

                    x: 980

                    height: 72
                    width: 268

                    color: "transparent"

                    Rectangle {
                        id: container_27

                        height: 48
                        width: 268

                        color: "transparent"

                        Text {
                            id: _text_19

                            x: 118.08

                            height: 48
                            width: 31

                            color: "#fabd00"
                            font.family: "Liberation Serif"
                            font.letterSpacing: -2.40
                            font.pixelSize: 48
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 48
                            lineHeightMode: Text.FixedHeight
                            text: "∞"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Rectangle {
                        id: container_28

                        y: 56

                        height: 16
                        width: 268

                        color: "transparent"

                        Text {
                            id: _text_20

                            x: 52.94

                            height: 16
                            width: 166

                            color: "#9cf0ff"
                            font.capitalization: Font.AllUppercase
                            font.family: "Inter"
                            font.letterSpacing: 2.40
                            font.pixelSize: 12
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 16
                            lineHeightMode: Text.FixedHeight
                            text: "Infinite Contrast"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }
        Rectangle {
            id: section_Product_Highlight_Asymmetric_CTA_

            x: 80
            y: 2465

            height: 645
            width: 1120

            clip: true
            color: "#2a2a2a"
            radius: 4

            Rectangle {
                id: container_29

                height: 645
                width: 560

                color: "transparent"

                Rectangle {
                    id: heading_2

                    x: 80
                    y: 80

                    height: 120
                    width: 400

                    color: "transparent"

                    Text {
                        id: tHE_ART_OF_PRECISION_

                        height: 120
                        width: 401

                        color: "#e5e2e1"
                        font.family: "Space Grotesk"
                        font.pixelSize: 48
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 60
                        lineHeightMode: Text.FixedHeight
                        text: "THE ART OF\nPRECISION."
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: container_30

                    x: 80
                    y: 232

                    height: 117
                    width: 400

                    color: "transparent"

                    Text {
                        id: every_component_in_a_NEON_MONOLITH_build_is_hand

                        height: 117
                        width: 401

                        color: "#c1c6d7"
                        font.family: "Inter"
                        font.pixelSize: 18
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 29.25
                        lineHeightMode: Text.FixedHeight
                        text: "Every component in a NEON MONOLITH build\nis hand-selected and stress-tested. We don't\njust build computers; we craft artifacts of\npower."
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: container_31

                    x: 80
                    y: 381

                    height: 96
                    width: 400

                    color: "transparent"

                    Rectangle {
                        id: container_32

                        y: 16

                        height: 64
                        width: 184

                        color: "transparent"

                        Image {
                            id: icon_1

                            source: Qt.resolvedUrl("assets/icon_26.png")
                        }
                        Rectangle {
                            id: _margin_2

                            x: 27.50

                            height: 64
                            width: 146.17

                            color: "transparent"

                            Rectangle {
                                id: container_33

                                x: 16

                                height: 64
                                width: 130.17

                                color: "transparent"

                                Rectangle {
                                    id: heading_7

                                    height: 24
                                    width: 130.17

                                    color: "transparent"

                                    Text {
                                        id: _text_21

                                        height: 24
                                        width: 132

                                        color: "#e5e2e1"
                                        font.family: "Inter"
                                        font.pixelSize: 16
                                        font.weight: Font.Bold
                                        horizontalAlignment: Text.AlignLeft
                                        lineHeight: 24
                                        lineHeightMode: Text.FixedHeight
                                        text: "Lifetime Support"
                                        textFormat: Text.PlainText
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                    }
                                }
                                Rectangle {
                                    id: container_34

                                    y: 24

                                    height: 40
                                    width: 130.17

                                    color: "transparent"

                                    Text {
                                        id: _text_22

                                        height: 40
                                        width: 120

                                        color: "#c1c6d7"
                                        font.family: "Inter"
                                        font.pixelSize: 14
                                        font.weight: Font.Normal
                                        horizontalAlignment: Text.AlignLeft
                                        lineHeight: 20
                                        lineHeightMode: Text.FixedHeight
                                        text: "Our engineers are\nalways on call."
                                        textFormat: Text.PlainText
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                    }
                                }
                            }
                        }
                    }
                    Rectangle {
                        id: container_35

                        x: 216
                        y: 16

                        height: 64
                        width: 184

                        color: "transparent"

                        Image {
                            id: icon_2

                            source: Qt.resolvedUrl("assets/icon_27.png")
                        }
                        Rectangle {
                            id: _margin_3

                            x: 20

                            height: 64
                            width: 147.38

                            color: "transparent"

                            Rectangle {
                                id: container_36

                                x: 16

                                height: 64
                                width: 131.38

                                color: "transparent"

                                Rectangle {
                                    id: heading_8

                                    height: 24
                                    width: 131.38

                                    color: "transparent"

                                    Text {
                                        id: _text_23

                                        height: 24
                                        width: 100

                                        color: "#e5e2e1"
                                        font.family: "Inter"
                                        font.pixelSize: 16
                                        font.weight: Font.Bold
                                        horizontalAlignment: Text.AlignLeft
                                        lineHeight: 24
                                        lineHeightMode: Text.FixedHeight
                                        text: "Overclocked"
                                        textFormat: Text.PlainText
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                    }
                                }
                                Rectangle {
                                    id: container_37

                                    y: 24

                                    height: 40
                                    width: 131.38

                                    color: "transparent"

                                    Text {
                                        id: _text_24

                                        height: 40
                                        width: 133

                                        color: "#c1c6d7"
                                        font.family: "Inter"
                                        font.pixelSize: 14
                                        font.weight: Font.Normal
                                        horizontalAlignment: Text.AlignLeft
                                        lineHeight: 20
                                        lineHeightMode: Text.FixedHeight
                                        text: "Pushing boundaries\nsafely."
                                        textFormat: Text.PlainText
                                        verticalAlignment: Text.AlignVCenter
                                        wrapMode: Text.Wrap
                                    }
                                }
                            }
                        }
                    }
                }
                Rectangle {
                    id: button_3

                    x: 80
                    y: 509

                    height: 56
                    width: 216.14

                    color: "#fabd00"
                    radius: 9999

                    Text {
                        id: _text_25

                        x: 32
                        y: 16

                        height: 24
                        width: 154

                        color: "#3f2e00"
                        font.family: "Inter"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignHCenter
                        lineHeight: 24
                        lineHeightMode: Text.FixedHeight
                        text: "Build Your Monolith"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
            }
            Rectangle {
                id: container_38

                x: 560
                y: 72.50

                height: 500
                width: 560

                color: "transparent"

                Image {
                    id: pC_Build

                    clip: true
                    source: Qt.resolvedUrl("assets/pC_Build.png")
                }
            }
        }
    }
    Rectangle {
        id: footer

        y: 3206

        height: 281
        width: 1280

        color: "#0a0a0a"

        Rectangle {
            id: container_39

            y: 80

            height: 161
            width: 1280

            color: "transparent"

            Text {
                id: _text_26

                x: 562.28

                height: 28
                width: 157

                color: "#f5f5f5"
                font.family: "Inter"
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
                id: _margin_4

                x: 286.17
                y: 28

                height: 52
                width: 707.65

                color: "transparent"

                Rectangle {
                    id: container_40

                    y: 32

                    height: 20
                    width: 707.65

                    color: "transparent"

                    Rectangle {
                        id: link_1

                        height: 20
                        width: 92.58

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_27

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
                        id: link_2

                        x: 124.58

                        height: 20
                        width: 112.77

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_28

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
                        id: link_3

                        x: 269.35

                        height: 20
                        width: 108.80

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_29

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
                        id: link_4

                        x: 410.15

                        height: 20
                        width: 58.05

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_30

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
                        id: link_5

                        x: 500.20

                        height: 20
                        width: 50.98

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_31

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
                        id: link_6

                        x: 583.18

                        height: 20
                        width: 124.47

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_32

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
                id: _margin_5

                x: 416
                y: 80

                height: 81
                width: 448

                color: "transparent"

                Image {
                    id: horizontalBorder

                    y: 32

                    source: Qt.resolvedUrl("assets/horizontalBorder_9.png")

                    Text {
                        id: _text_33

                        x: 23.38
                        y: 33

                        height: 16
                        width: 404

                        color: "#737373"
                        font.family: "Inter"
                        font.letterSpacing: 1.20
                        font.pixelSize: 12
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignHCenter
                        lineHeight: 16
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
    Image {
        id: topNavBar

        source: Qt.resolvedUrl("assets/topNavBar_3.png")
    }
}