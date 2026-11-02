import QtQuick
import QtQuick.Shapes

Rectangle {
    id: about_Page_Electronics_Shop

    height: 3952
    width: 1280

    color: "#131313"

    Rectangle {
        id: main_Content

        height: 3631
        width: 1280

        color: "transparent"

        Rectangle {
            id: header_Hero_Section

            y: 96

            height: 716
            width: 1280

            clip: true
            color: "transparent"

            Rectangle {
                id: container

                height: 716
                width: 1280

                color: "transparent"

                Image {
                    id: aB6AXuCaKV_zfyJgM8Of1o81tRakzJbVPFyZrgx1mQkMpdhH

                    clip: true
                    source: Qt.resolvedUrl("assets/aB6AXuCaKV_zfyJgM8Of1o81tRakzJbVPFyZrgx1mQkMpdhH.png")
                }
                Shape {
                    id: gradient

                    height: 716
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
                id: container_1

                x: 96
                y: 188

                height: 340
                width: 645.36

                color: "transparent"

                Rectangle {
                    id: container_2

                    height: 16
                    width: 645.36

                    color: "transparent"

                    Text {
                        id: _text

                        height: 16
                        width: 303

                        color: "#bdf4ff"
                        font.capitalization: Font.AllUppercase
                        font.family: "Inter"
                        font.letterSpacing: 2.40
                        font.pixelSize: 12
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 16
                        lineHeightMode: Text.FixedHeight
                        text: "Defined by Light. Driven by Code."
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: heading_1

                    y: 32

                    height: 192
                    width: 645.36

                    color: "transparent"

                    Image {
                        id: _text_1

                        source: Qt.resolvedUrl("assets/_text.png")
                    }
                }
                Rectangle {
                    id: container_3

                    y: 240

                    height: 100
                    width: 645.36

                    color: "transparent"

                    Text {
                        id: _text_2

                        y: 16

                        height: 84
                        width: 647

                        color: "#c1c6d7"
                        font.family: "Inter"
                        font.pixelSize: 20
                        font.weight: Font.Light
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 28
                        lineHeightMode: Text.FixedHeight
                        text: "We don't just build electronics. We forge the vessels of digital\nexperience. Born in the intersection of high-performance engineering\nand midnight aesthetics."
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
            }
        }
        Rectangle {
            id: our_Origin_Section

            y: 812

            height: 752
            width: 1280

            color: "#131313"

            Rectangle {
                id: container_4

                x: 96
                y: 128

                height: 496
                width: 1088

                color: "transparent"

                Rectangle {
                    id: container_5

                    height: 496
                    width: 496

                    color: "transparent"

                    Rectangle {
                        id: _border

                        x: -22
                        y: -20

                        height: 496
                        width: 496

                        border.color: "#33fabd00"
                        border.width: 1
                        color: "transparent"
                    }
                    Rectangle {
                        id: aB6AXuB7RMEwxWmdRJsZfW8zHuI3a9dZeBh7KclD1gK2OxSx

                        height: 496
                        width: 496

                        clip: true
                        color: "#ffffff"
                    }
                }
                Rectangle {
                    id: container_6

                    x: 592
                    y: 46

                    height: 404
                    width: 496

                    color: "transparent"

                    Rectangle {
                        id: heading_2

                        height: 20
                        width: 496

                        color: "transparent"

                        Text {
                            id: our_Origin

                            height: 20
                            width: 499

                            color: "#bdf4ff"
                            font.capitalization: Font.AllUppercase
                            font.family: "Inter"
                            font.letterSpacing: 1.40
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            text: "Our Origin"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: heading_3

                        y: 44

                        height: 96
                        width: 496

                        color: "transparent"

                        Text {
                            id: forged_in_Silicon_and_Blue_

                            height: 96
                            width: 497

                            color: "#e5e2e1"
                            font.family: "Space Grotesk"
                            font.pixelSize: 48
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 48
                            lineHeightMode: Text.FixedHeight
                            text: "Forged in Silicon and\nBlue."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: container_7

                        y: 164

                        height: 112
                        width: 496

                        color: "transparent"

                        Text {
                            id: mONOLITH_began_in_a_basement_lab_illuminated_onl

                            y: 8

                            height: 104
                            width: 497

                            color: "#c1c6d7"
                            font.family: "Inter"
                            font.pixelSize: 16
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 26
                            lineHeightMode: Text.FixedHeight
                            text: "MONOLITH began in a basement lab illuminated only by the\nflicker of CRT monitors and the glow of soldering irons. Our\nfounders sought to bridge the gap between industrial brutality\nand digital elegance."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: container_8

                        y: 300

                        height: 104
                        width: 496

                        color: "transparent"

                        Text {
                            id: the_Blue_Hour_isn_t_just_a_time_for_us_it_s_the_

                            height: 104
                            width: 497

                            color: "#c1c6d7"
                            font.family: "Inter"
                            font.pixelSize: 16
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 26
                            lineHeightMode: Text.FixedHeight
                            text: "The \"Blue Hour\" isn't just a time for us—it's the environment\nwhere clarity meets creativity. Every component we've designed\nsince 2012 carries that original DNA: silent, powerful, and\nimpeccably sharp."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }
        Rectangle {
            id: section_Architecture_of_Excellence_Bento_Grid_

            y: 1564

            height: 1012
            width: 1280

            color: "#1c1b1b"

            Rectangle {
                id: container_9

                x: 96
                y: 128

                height: 756
                width: 1088

                color: "transparent"

                Rectangle {
                    id: container_10

                    height: 92
                    width: 1088

                    color: "transparent"

                    Rectangle {
                        id: heading_4

                        height: 60
                        width: 1088

                        color: "transparent"

                        Text {
                            id: _text_3

                            x: 144.40

                            height: 60
                            width: 798

                            color: "#e5e2e1"
                            font.family: "Space Grotesk"
                            font.letterSpacing: -3
                            font.pixelSize: 60
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 60
                            lineHeightMode: Text.FixedHeight
                            text: "The Architecture of Excellence"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: container_11

                        y: 76

                        height: 16
                        width: 1088

                        color: "transparent"

                        Text {
                            id: _text_4

                            x: 421.96

                            height: 16
                            width: 247

                            color: "#737373"
                            font.capitalization: Font.AllUppercase
                            font.family: "Inter"
                            font.letterSpacing: 1.20
                            font.pixelSize: 12
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 16
                            lineHeightMode: Text.FixedHeight
                            text: "High-Performance Engineering"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
                Rectangle {
                    id: container_12

                    y: 156

                    height: 600
                    width: 1088

                    color: "transparent"

                    Rectangle {
                        id: background

                        x: 741.33

                        height: 328.50
                        width: 346.67

                        color: "#fabd00"

                        Rectangle {
                            id: _margin

                            x: 48
                            y: 58.75

                            height: 61.01
                            width: 250.66

                            color: "transparent"

                            Rectangle {
                                id: container_13

                                height: 37.01
                                width: 250.66

                                color: "transparent"

                                Image {
                                    id: icon

                                    source: Qt.resolvedUrl("assets/icon_5.png")
                                }
                            }
                        }
                        Rectangle {
                            id: heading_4_margin

                            x: 48
                            y: 130.75

                            height: 48
                            width: 250.66

                            color: "transparent"

                            Rectangle {
                                id: heading_5

                                height: 32
                                width: 250.66

                                color: "transparent"

                                Text {
                                    id: micron_Precision

                                    height: 32
                                    width: 252

                                    color: "#3f2e00"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 24
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 32
                                    lineHeightMode: Text.FixedHeight
                                    text: "Micron Precision"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Rectangle {
                            id: container_14

                            x: 48
                            y: 177.88

                            height: 91.88
                            width: 250.66

                            color: "transparent"
                            opacity: 0.90

                            Text {
                                id: _text_5

                                height: 91
                                width: 245

                                color: "#3f2e00"
                                font.family: "Inter"
                                font.pixelSize: 14
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 22.75
                                lineHeightMode: Text.FixedHeight
                                text: "Every chassis is milled from a single\nblock of aerospace-grade aluminum,\nensuring zero structural resonance\nand perfect heat dissipation."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                    Image {
                        id: background_HorizontalBorder

                        y: 352.50

                        source: Qt.resolvedUrl("assets/background_HorizontalBorder.png")

                        Rectangle {
                            id: container_15

                            x: 32
                            y: 33

                            height: 48
                            width: 282.67

                            color: "transparent"

                            Text {
                                id: element

                                height: 48
                                width: 284

                                color: "#bdf4ff"
                                font.family: "Space Grotesk"
                                font.pixelSize: 48
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 48
                                lineHeightMode: Text.FixedHeight
                                text: "99.9%"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_16

                            x: 32
                            y: 167.50

                            height: 48
                            width: 282.67

                            color: "transparent"

                            Rectangle {
                                id: heading_6

                                height: 28
                                width: 282.67

                                color: "transparent"

                                Text {
                                    id: signal_Purity

                                    height: 28
                                    width: 284

                                    color: "#e5e2e1"
                                    font.family: "Inter"
                                    font.pixelSize: 18
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 28
                                    lineHeightMode: Text.FixedHeight
                                    text: "Signal Purity"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_17

                                y: 32

                                height: 16
                                width: 282.67

                                color: "transparent"

                                Text {
                                    id: zero_interference_audio_architecture

                                    height: 16
                                    width: 284

                                    color: "#c1c6d7"
                                    font.capitalization: Font.AllUppercase
                                    font.family: "Inter"
                                    font.letterSpacing: -0.60
                                    font.pixelSize: 12
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 16
                                    lineHeightMode: Text.FixedHeight
                                    text: "Zero-interference audio architecture"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                    }
                    Rectangle {
                        id: background_Border

                        x: 370.67
                        y: 352.50

                        height: 247.50
                        width: 717.33

                        border.color: "#0dffffff"
                        border.width: 1
                        color: "#131313"

                        Rectangle {
                            id: container_18

                            x: 49
                            y: 79.75

                            height: 88
                            width: 428.87

                            color: "transparent"

                            Rectangle {
                                id: heading_7

                                height: 32
                                width: 428.87

                                color: "transparent"

                                Text {
                                    id: _text_6

                                    height: 32
                                    width: 253

                                    color: "#e5e2e1"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 24
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 32
                                    lineHeightMode: Text.FixedHeight
                                    text: "The Material Integrity"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_19

                                y: 48

                                height: 40
                                width: 428.87

                                color: "transparent"

                                Text {
                                    id: _text_7

                                    height: 40
                                    width: 430

                                    color: "#c1c6d7"
                                    font.family: "Inter"
                                    font.pixelSize: 14
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 20
                                    lineHeightMode: Text.FixedHeight
                                    text: "We source rare-earth minerals ethically, ensuring that the soul of\nour tech remains as clean as its exterior."
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                        Rectangle {
                            id: _border_1

                            x: 540.32
                            y: 59.75

                            height: 128
                            width: 128

                            border.color: "#4dfabd00"
                            border.width: 2
                            color: "transparent"
                            radius: 12

                            Image {
                                id: icon_1

                                x: 2
                                y: 2

                                source: Qt.resolvedUrl("assets/icon_6.png")
                            }
                        }
                    }
                    Rectangle {
                        id: background_1

                        height: 328.50
                        width: 717.33

                        clip: true
                        color: "#201f1f"

                        Image {
                            id: aB6AXuBIW0bsdZTFTQ77D4LQLAmtqpVl3BqfIarJZAo8jFJE

                            clip: true
                            source: Qt.resolvedUrl("assets/aB6AXuBIW0bsdZTFTQ77D4LQLAmtqpVl3BqfIarJZAo8jFJE.png")
                        }
                        Shape {
                            id: gradient_1

                            height: 328.50
                            width: 717.33

                            ShapePath {
                                id: gradient_1ShapePath

                                strokeColor: "#000"
                                strokeWidth: 0

                                fillGradient: LinearGradient {
                                    id: gradientNode_1
                                
                                    x1: gradient_1.width * 0.5000000272958423
                                    x2: gradient_1.width * 0.5000000272958424
                                    y1: gradient_1.height * 1
                                    y2: gradient_1.height * 0
                                
                                    GradientStop {
                                        color: "#cc000000"
                                        position: 0
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
                            id: container_20

                            x: 48
                            y: 200.50

                            height: 80
                            width: 621.33

                            color: "transparent"

                            Rectangle {
                                id: heading_8

                                height: 32
                                width: 621.33

                                color: "transparent"

                                Text {
                                    id: neural_Processing

                                    height: 32
                                    width: 623

                                    color: "#e5e2e1"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 24
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 32
                                    lineHeightMode: Text.FixedHeight
                                    text: "Neural Processing"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_21

                                y: 40

                                height: 40
                                width: 448

                                color: "transparent"

                                Text {
                                    id: _text_8

                                    height: 40
                                    width: 448

                                    color: "#c1c6d7"
                                    font.family: "Inter"
                                    font.pixelSize: 14
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 20
                                    lineHeightMode: Text.FixedHeight
                                    text: "Our proprietary cooling systems allow for 40% higher clock speeds\nwithout thermal throttling."
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            id: section_Guiding_Principles

            y: 2576

            height: 639
            width: 1280

            color: "transparent"

            Rectangle {
                id: heading_9

                x: 96
                y: 128

                height: 20
                width: 1088

                color: "transparent"

                Text {
                    id: _text_9

                    x: 439.60

                    height: 20
                    width: 212

                    color: "#bdf4ff"
                    font.capitalization: Font.AllUppercase
                    font.family: "Inter"
                    font.letterSpacing: 1.40
                    font.pixelSize: 14
                    font.weight: Font.Normal
                    horizontalAlignment: Text.AlignHCenter
                    lineHeight: 20
                    lineHeightMode: Text.FixedHeight
                    text: "Our Guiding Principles"
                    textFormat: Text.PlainText
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                }
            }
            Rectangle {
                id: container_22

                x: 96
                y: 212

                height: 299
                width: 1088

                color: "transparent"

                Rectangle {
                    id: background_2

                    height: 299
                    width: 236

                    color: "#1c1b1b"

                    Rectangle {
                        id: container_23

                        x: 32
                        y: 32

                        height: 30.11
                        width: 172

                        color: "transparent"

                        Image {
                            id: icon_2

                            source: Qt.resolvedUrl("assets/icon_7.png")
                        }
                    }
                    Rectangle {
                        id: heading_10

                        x: 32
                        y: 96

                        height: 28
                        width: 172

                        color: "transparent"

                        Text {
                            id: _text_10

                            height: 28
                            width: 81

                            color: "#e5e2e1"
                            font.capitalization: Font.AllUppercase
                            font.family: "Space Grotesk"
                            font.pixelSize: 20
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 28
                            lineHeightMode: Text.FixedHeight
                            text: "Mission"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Rectangle {
                        id: container_24

                        x: 32
                        y: 147

                        height: 114.75
                        width: 172

                        color: "transparent"

                        Text {
                            id: _text_11

                            height: 114
                            width: 167

                            color: "#c1c6d7"
                            font.family: "Inter"
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 22.75
                            lineHeightMode: Text.FixedHeight
                            text: "To eliminate the friction\nbetween human intent\nand digital execution\nthrough uncompromising\nhardware."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
                Rectangle {
                    id: background_3

                    x: 284

                    height: 299
                    width: 236

                    color: "#1c1b1b"

                    Rectangle {
                        id: container_25

                        x: 32
                        y: 32

                        height: 28.50
                        width: 172

                        color: "transparent"

                        Image {
                            id: icon_3

                            source: Qt.resolvedUrl("assets/icon_8.png")
                        }
                    }
                    Rectangle {
                        id: heading_11

                        x: 32
                        y: 96

                        height: 28
                        width: 172

                        color: "transparent"

                        Text {
                            id: _text_12

                            height: 28
                            width: 100

                            color: "#e5e2e1"
                            font.capitalization: Font.AllUppercase
                            font.family: "Space Grotesk"
                            font.pixelSize: 20
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 28
                            lineHeightMode: Text.FixedHeight
                            text: "Precision"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Rectangle {
                        id: container_26

                        x: 32
                        y: 147.13

                        height: 91.88
                        width: 172

                        color: "transparent"

                        Text {
                            id: _text_13

                            height: 91
                            width: 161

                            color: "#c1c6d7"
                            font.family: "Inter"
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 22.75
                            lineHeightMode: Text.FixedHeight
                            text: "We measure in microns.\nWe test in extremes. If it\nisn't perfect, it doesn't\nleave the Monolith."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
                Rectangle {
                    id: background_4

                    x: 568

                    height: 299
                    width: 236

                    color: "#1c1b1b"

                    Rectangle {
                        id: container_27

                        x: 32
                        y: 32

                        height: 28.58
                        width: 172

                        color: "transparent"

                        Image {
                            id: icon_4

                            source: Qt.resolvedUrl("assets/icon_9.png")
                        }
                    }
                    Rectangle {
                        id: heading_12

                        x: 32
                        y: 96

                        height: 56
                        width: 172

                        color: "transparent"

                        Text {
                            id: _text_14

                            height: 56
                            width: 98

                            color: "#e5e2e1"
                            font.capitalization: Font.AllUppercase
                            font.family: "Space Grotesk"
                            font.pixelSize: 20
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 28
                            lineHeightMode: Text.FixedHeight
                            text: "Material\nIntegrity"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: container_28

                        x: 32
                        y: 175.13

                        height: 91.88
                        width: 172

                        color: "transparent"

                        Text {
                            id: _text_15

                            height: 91
                            width: 172

                            color: "#c1c6d7"
                            font.family: "Inter"
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 22.75
                            lineHeightMode: Text.FixedHeight
                            text: "Glass, Steel, Silicon. No\ncompromises. We build\nfor decades, not for fiscal\nquarters."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
                Rectangle {
                    id: background_5

                    x: 852

                    height: 299
                    width: 236

                    color: "#1c1b1b"

                    Rectangle {
                        id: container_29

                        x: 32
                        y: 32

                        height: 24
                        width: 172

                        color: "transparent"

                        Image {
                            id: icon_5

                            source: Qt.resolvedUrl("assets/icon_10.png")
                        }
                    }
                    Rectangle {
                        id: heading_13

                        x: 32
                        y: 96

                        height: 28
                        width: 172

                        color: "transparent"

                        Text {
                            id: _text_16

                            height: 28
                            width: 160

                            color: "#e5e2e1"
                            font.capitalization: Font.AllUppercase
                            font.family: "Space Grotesk"
                            font.pixelSize: 20
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 28
                            lineHeightMode: Text.FixedHeight
                            text: "Human-Centric"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Rectangle {
                        id: container_30

                        x: 32
                        y: 147

                        height: 114.75
                        width: 172

                        color: "transparent"

                        Text {
                            id: _text_17

                            height: 114
                            width: 167

                            color: "#c1c6d7"
                            font.family: "Inter"
                            font.pixelSize: 14
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 22.75
                            lineHeightMode: Text.FixedHeight
                            text: "Technology is the tool,\nhumans are the purpose.\nOur ergonomics are\ndictated by biology, not\ntrends."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }
        Shape {
            id: section_Final_CTA_Newsletter

            y: 3215

            height: 416
            width: 1280

            ShapePath {
                id: section_Final_CTA_NewsletterShapePath

                strokeColor: "#000"
                strokeWidth: 0

                fillGradient: LinearGradient {
                    id: gradientNode_2
                
                    x1: section_Final_CTA_Newsletter.width * 0.4044658301510115
                    x2: section_Final_CTA_Newsletter.width * 0.5955342435408527
                    y1: section_Final_CTA_Newsletter.height * -0.40446583015101173
                    y2: section_Final_CTA_Newsletter.height * 1.404465756459147
                
                    GradientStop {
                        color: "#1afabd00"
                        position: 0
                    }
                    GradientStop {
                        color: "#00fabd00"
                        position: 1
                    }
                }

                PathRectangle {
                    id: section_Final_CTA_NewsletterPathRectangle

                    x: 0
                    y: 0

                    height: section_Final_CTA_Newsletter.height
                    width: section_Final_CTA_Newsletter.width
                }
            }
            Rectangle {
                id: container_31

                x: 192
                y: 96

                height: 208
                width: 896

                color: "transparent"

                Rectangle {
                    id: heading_14

                    height: 48
                    width: 896

                    color: "transparent"

                    Text {
                        id: _text_18

                        x: 196.55

                        height: 48
                        width: 504

                        color: "#e5e2e1"
                        font.family: "Space Grotesk"
                        font.pixelSize: 48
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignHCenter
                        lineHeight: 48
                        lineHeightMode: Text.FixedHeight
                        text: "Join the Transmission"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: container_32

                    y: 80

                    height: 24
                    width: 896

                    color: "transparent"

                    Text {
                        id: _text_19

                        x: 140.11

                        height: 24
                        width: 617

                        color: "#c1c6d7"
                        font.family: "Inter"
                        font.pixelSize: 16
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignHCenter
                        lineHeight: 24
                        lineHeightMode: Text.FixedHeight
                        text: "Be the first to know about new drops, technical blueprints, and showroom events."
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: form

                    x: 192
                    y: 136

                    height: 72
                    width: 512

                    color: "transparent"

                    Rectangle {
                        id: input

                        y: 16

                        height: 56
                        width: 361.08

                        clip: true
                        color: "#353534"

                        Rectangle {
                            id: container_33

                            x: 24
                            y: 19

                            height: 17
                            width: 313.08

                            clip: true
                            color: "transparent"

                            Text {
                                id: enter_your_coordinates_Email_

                                height: 17
                                width: 316

                                color: "#6b7280"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.letterSpacing: 1.40
                                font.pixelSize: 14
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                text: "Enter your coordinates (Email)"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                    Shape {
                        id: button

                        x: 377.08
                        y: 16

                        height: 56
                        width: 134.92

                        ShapePath {
                            id: buttonShapePath

                            strokeColor: "#000"
                            strokeWidth: 0

                            fillGradient: LinearGradient {
                                id: gradientNode_3
                            
                                x1: button.width * 0
                                x2: button.width * 1
                                y1: button.height * 0.5
                                y2: button.height * 0.5
                            
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
                            }
                        }
                        Text {
                            id: _text_20

                            x: 32
                            y: 16

                            height: 24
                            width: 72

                            color: "#3f2e00"
                            font.capitalization: Font.AllUppercase
                            font.family: "Space Grotesk"
                            font.pixelSize: 16
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 24
                            lineHeightMode: Text.FixedHeight
                            text: "Connect"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }
    }
    Rectangle {
        id: footer

        y: 3631

        height: 321
        width: 1280

        color: "#171717"

        Rectangle {
            id: container_34

            height: 240
            width: 1280

            color: "transparent"

            Rectangle {
                id: container_35

                x: 48
                y: 64

                height: 112
                width: 362.67

                color: "transparent"

                Rectangle {
                    id: container_36

                    height: 28
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: mONOLITH

                        height: 28
                        width: 364

                        color: "#ffffff"
                        font.family: "Inter"
                        font.pixelSize: 18
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 28
                        lineHeightMode: Text.FixedHeight
                        text: "MONOLITH"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: container_37

                    y: 52

                    height: 32
                    width: 320

                    color: "transparent"

                    Text {
                        id: _text_21

                        height: 32
                        width: 319

                        color: "#a3a3a3"
                        font.family: "Inter"
                        font.letterSpacing: -0.30
                        font.pixelSize: 12
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 16
                        lineHeightMode: Text.FixedHeight
                        text: "Engineering the future of high-end electronics. Designed in\nthe void, built for the light."
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
            }
            Rectangle {
                id: container_38

                x: 458.67
                y: 64

                height: 112
                width: 362.67

                color: "transparent"

                Rectangle {
                    id: container_39

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: eXPLORE

                        height: 16
                        width: 364

                        color: "#ffffff"
                        font.family: "Inter"
                        font.letterSpacing: -0.30
                        font.pixelSize: 12
                        font.weight: Font.Medium
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 16
                        lineHeightMode: Text.FixedHeight
                        text: "EXPLORE"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: link

                    y: 32

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: privacy_Policy

                        height: 16
                        width: 364

                        color: "#a3a3a3"
                        font.family: "Inter"
                        font.letterSpacing: -0.30
                        font.pixelSize: 12
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 16
                        lineHeightMode: Text.FixedHeight
                        text: "Privacy Policy"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: link_1

                    y: 64

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: terms_of_Service

                        height: 16
                        width: 364

                        color: "#a3a3a3"
                        font.family: "Inter"
                        font.letterSpacing: -0.30
                        font.pixelSize: 12
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 16
                        lineHeightMode: Text.FixedHeight
                        text: "Terms of Service"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: link_2

                    y: 96

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: newsletter

                        height: 16
                        width: 364

                        color: "#a3a3a3"
                        font.family: "Inter"
                        font.letterSpacing: -0.30
                        font.pixelSize: 12
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 16
                        lineHeightMode: Text.FixedHeight
                        text: "Newsletter"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
            }
            Rectangle {
                id: container_40

                x: 869.33
                y: 64

                height: 112
                width: 362.67

                color: "transparent"

                Rectangle {
                    id: container_41

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: sOCIAL

                        height: 16
                        width: 364

                        color: "#ffffff"
                        font.family: "Inter"
                        font.letterSpacing: -0.30
                        font.pixelSize: 12
                        font.weight: Font.Medium
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 16
                        lineHeightMode: Text.FixedHeight
                        text: "SOCIAL"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: link_3

                    y: 32

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: instagram

                        height: 16
                        width: 364

                        color: "#a3a3a3"
                        font.family: "Inter"
                        font.letterSpacing: -0.30
                        font.pixelSize: 12
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 16
                        lineHeightMode: Text.FixedHeight
                        text: "Instagram"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: link_4

                    y: 64

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: linkedIn

                        height: 16
                        width: 364

                        color: "#a3a3a3"
                        font.family: "Inter"
                        font.letterSpacing: -0.30
                        font.pixelSize: 12
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 16
                        lineHeightMode: Text.FixedHeight
                        text: "LinkedIn"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
            }
        }
        Image {
            id: horizontalBorder

            y: 240

            source: Qt.resolvedUrl("assets/horizontalBorder_3.png")

            Rectangle {
                id: container_42

                x: 48
                y: 33

                height: 16
                width: 328.58

                color: "transparent"

                Text {
                    id: _text_22

                    height: 16
                    width: 330

                    color: "#737373"
                    font.family: "Inter"
                    font.letterSpacing: -0.30
                    font.pixelSize: 12
                    font.weight: Font.Normal
                    horizontalAlignment: Text.AlignLeft
                    lineHeight: 16
                    lineHeightMode: Text.FixedHeight
                    text: "© 2024 MONOLITH ELECTRONICS. ALL RIGHTS RESERVED."
                    textFormat: Text.PlainText
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                }
            }
            Rectangle {
                id: container_43

                x: 1104
                y: 40.50

                height: 1
                width: 128

                color: "transparent"

                Rectangle {
                    id: horizontal_Divider

                    height: 1
                    width: 32

                    color: "#404040"
                }
                Rectangle {
                    id: horizontal_Divider_1

                    x: 48

                    height: 1
                    width: 32

                    color: "#404040"
                }
                Rectangle {
                    id: horizontal_Divider_2

                    x: 96

                    height: 1
                    width: 32

                    color: "#eab308"
                }
            }
        }
    }
    Image {
        id: top_Navigation

        source: Qt.resolvedUrl("assets/top_Navigation.png")
    }
}