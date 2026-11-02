import QtQuick
import QtQuick.Shapes

Rectangle {
    id: about_Page

    height: 3809
    width: 1280

    color: "#131313"

    Rectangle {
        id: main

        height: 3532.75
        width: 1280

        color: "transparent"

        Rectangle {
            id: hero_Section

            y: 80

            height: 819
            width: 1280

            clip: true
            color: "transparent"

            Rectangle {
                id: container

                height: 819
                width: 1280

                color: "transparent"

                Image {
                    id: aB6AXuDCwqI1ZDX1hk4VowCO4QyM4YuZg5XpEQDF69LnSwO5

                    clip: true
                    source: Qt.resolvedUrl("assets/aB6AXuDCwqI1ZDX1hk4VowCO4QyM4YuZg5XpEQDF69LnSwO5.png")
                }
                Shape {
                    id: gradient

                    height: 819
                    width: 1280

                    ShapePath {
                        id: gradientShapePath

                        strokeColor: "#000"
                        strokeWidth: 0

                        fillGradient: LinearGradient {
                            id: gradientNode
                        
                            x1: gradient.width * 0
                            x2: gradient.width * 1
                            y1: gradient.height * 0.5
                            y2: gradient.height * 0.5
                        
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

                x: 80
                y: 228.50

                height: 362
                width: 656.75

                color: "transparent"

                Rectangle {
                    id: container_2

                    height: 24
                    width: 656.75

                    color: "transparent"

                    Text {
                        id: _text

                        height: 24
                        width: 148

                        color: "#fabd00"
                        font.capitalization: Font.AllUppercase
                        font.family: "Inter"
                        font.letterSpacing: 4.80
                        font.pixelSize: 16
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 24
                        lineHeightMode: Text.FixedHeight
                        text: "Our Origin"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: heading_1

                    y: 40

                    height: 192
                    width: 656.75

                    color: "transparent"

                    Image {
                        id: _text_1

                        source: Qt.resolvedUrl("assets/_text_2.png")
                    }
                }
                Rectangle {
                    id: container_3

                    y: 248

                    height: 114
                    width: 576

                    color: "transparent"

                    Text {
                        id: _text_2

                        y: 16

                        height: 98
                        width: 559

                        color: "#c1c6d7"
                        font.family: "Inter"
                        font.pixelSize: 20
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 32.50
                        lineHeightMode: Text.FixedHeight
                        text: "NEON MONOLITH was founded on a singular obsession: to\nbridge the gap between industrial computing power and\nhaute couture aesthetics."
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
            }
        }
        Rectangle {
            id: company_Story_Section_Asymmetric_Layout

            y: 899

            height: 916
            width: 1280

            color: "#1c1b1b"

            Rectangle {
                id: container_4

                x: 80
                y: 128

                height: 660
                width: 1120

                color: "transparent"

                Rectangle {
                    id: container_5

                    height: 660
                    width: 528

                    color: "transparent"

                    Rectangle {
                        id: background

                        height: 660
                        width: 528

                        clip: true
                        color: "#2a2a2a"
                        radius: 4

                        Image {
                            id: aB6AXuCL04fro3z1pEC9G4ULOpljRf62VLvOlHZo3wM5KZO0

                            clip: true
                            source: Qt.resolvedUrl("assets/aB6AXuCL04fro3z1pEC9G4ULOpljRf62VLvOlHZo3wM5KZO0.png")
                        }
                        Image {
                            id: overlay_Shadow

                            source: Qt.resolvedUrl("assets/overlay_Shadow.png")
                        }
                    }
                    Image {
                        id: overlay_Blur_OverlayBlur

                        x: 304
                        y: 436

                        source: Qt.resolvedUrl("assets/overlay_Blur_OverlayBlur.png")
                    }
                }
                Rectangle {
                    id: container_6

                    x: 592
                    y: 133

                    height: 394
                    width: 528

                    color: "transparent"

                    Rectangle {
                        id: heading_2

                        height: 80
                        width: 528

                        color: "transparent"

                        Text {
                            id: tHE_ARCHITECTURE_OF_EXCELLENCE

                            height: 80
                            width: 529

                            color: "#e5e2e1"
                            font.family: "Space Grotesk"
                            font.pixelSize: 36
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 40
                            lineHeightMode: Text.FixedHeight
                            text: "THE ARCHITECTURE OF\nEXCELLENCE"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: container_7

                        y: 112

                        height: 282
                        width: 528

                        color: "transparent"

                        Rectangle {
                            id: container_8

                            height: 104
                            width: 528

                            color: "transparent"

                            Text {
                                id: established_in_2021_NEON_MONOLITH_emerged_from_a

                                height: 104
                                width: 529

                                color: "#c1c6d7"
                                font.family: "Inter"
                                font.pixelSize: 16
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 26
                                lineHeightMode: Text.FixedHeight
                                text: "Established in 2021, NEON MONOLITH emerged from a high-\nperformance engineering lab in Tokyo. We saw a market saturated\nwith plastic and uninspired design, where power was hidden behind\ngeneric shells."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_9

                            y: 128

                            height: 78
                            width: 528

                            color: "transparent"

                            Text {
                                id: we_decided_that_the_machine_should_be_as_powerfu

                                height: 78
                                width: 529

                                color: "#c1c6d7"
                                font.family: "Inter"
                                font.pixelSize: 16
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 26
                                lineHeightMode: Text.FixedHeight
                                text: "We decided that the machine should be as powerful as its output. We\nreplaced standard enclosures with aerospace-grade alloys and\nintroduced liquid cooling systems that double as kinetic sculptures."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_10

                            y: 230

                            height: 52
                            width: 528

                            color: "transparent"

                            Text {
                                id: today_we_serve_the_world_s_most_demanding_creato

                                height: 52
                                width: 529

                                color: "#c1c6d7"
                                font.family: "Inter"
                                font.pixelSize: 16
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 26
                                lineHeightMode: Text.FixedHeight
                                text: "Today, we serve the world's most demanding creators, developers,\nand visionaries who refuse to compromise on either form or function."
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
            id: section_Mission_Values_Bento_Grid

            y: 1815

            height: 935.75
            width: 1280

            color: "#131313"

            Rectangle {
                id: container_11

                x: 80
                y: 128

                height: 679.75
                width: 1120

                color: "transparent"

                Rectangle {
                    id: container_12

                    height: 60
                    width: 1120

                    color: "transparent"

                    Rectangle {
                        id: heading_3

                        height: 40
                        width: 1120

                        color: "transparent"

                        Text {
                            id: oUR_GUIDING_PRINCIPLES

                            height: 40
                            width: 1121

                            color: "#e5e2e1"
                            font.family: "Space Grotesk"
                            font.pixelSize: 36
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 40
                            lineHeightMode: Text.FixedHeight
                            text: "OUR GUIDING PRINCIPLES"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Rectangle {
                        id: background_1

                        y: 56

                        height: 4
                        width: 96

                        color: "#fabd00"
                    }
                }
                Rectangle {
                    id: container_13

                    y: 140

                    height: 539.75
                    width: 1120

                    color: "transparent"

                    Image {
                        id: value_Card_1

                        x: 762.67

                        source: Qt.resolvedUrl("assets/value_Card_1.png")

                        Image {
                            id: icon

                            x: 35.72
                            y: 39.12

                            source: Qt.resolvedUrl("assets/icon_28.png")
                        }
                        Rectangle {
                            id: heading_4

                            x: 32
                            y: 85

                            height: 28
                            width: 293.34

                            color: "transparent"

                            Text {
                                id: _text_3

                                height: 28
                                width: 181

                                color: "#e5e2e1"
                                font.family: "Space Grotesk"
                                font.pixelSize: 20
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 28
                                lineHeightMode: Text.FixedHeight
                                text: "Absolute Precision"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_14

                            x: 32
                            y: 125

                            height: 60
                            width: 293.34

                            color: "transparent"

                            Text {
                                id: _text_4

                                height: 60
                                width: 283

                                color: "#c1c6d7"
                                font.family: "Inter"
                                font.pixelSize: 14
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 20
                                lineHeightMode: Text.FixedHeight
                                text: "Every screw, trace, and weld is executed\nwith sub-millimeter accuracy. Perfection is\nour baseline."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                    Rectangle {
                        id: value_Card_2

                        y: 323.75

                        height: 216
                        width: 357.33

                        color: "#1c1b1b"
                        radius: 4

                        Image {
                            id: icon_1

                            x: 34.50
                            y: 38.75

                            source: Qt.resolvedUrl("assets/icon_29.png")
                        }
                        Rectangle {
                            id: heading_5

                            x: 32
                            y: 84

                            height: 28
                            width: 293.33

                            color: "transparent"

                            Text {
                                id: _text_5

                                height: 28
                                width: 171

                                color: "#e5e2e1"
                                font.family: "Space Grotesk"
                                font.pixelSize: 20
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 28
                                lineHeightMode: Text.FixedHeight
                                text: "Material Integrity"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_15

                            x: 32
                            y: 124

                            height: 60
                            width: 293.33

                            color: "transparent"

                            Text {
                                id: _text_6

                                height: 60
                                width: 284

                                color: "#c1c6d7"
                                font.family: "Inter"
                                font.pixelSize: 14
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 20
                                lineHeightMode: Text.FixedHeight
                                text: "We only use authentic materials. If it looks\nlike metal, it is metal. If it looks like glass, it\nis sapphire."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                    Rectangle {
                        id: value_Card_3

                        x: 381.33
                        y: 323.75

                        height: 216
                        width: 738.67

                        color: "#1c1b1b"
                        radius: 4

                        Rectangle {
                            id: background_2

                            x: 32
                            y: 47.76

                            height: 120.48
                            width: 214.22

                            clip: true
                            color: "#2a2a2a"
                            radius: 2

                            Image {
                                id: aB6AXuDNf9Hkpvd_a3SgSabuKppgZ7IIoSy4tF8863mRzcun

                                clip: true
                                source: Qt.resolvedUrl("assets/aB6AXuDNf9Hkpvd_a3SgSabuKppgZ7IIoSy4tF8863mRzcun.png")
                            }
                        }
                        Rectangle {
                            id: container_16

                            x: 278.22
                            y: 58

                            height: 100
                            width: 428.45

                            color: "transparent"

                            Rectangle {
                                id: heading_6

                                height: 28
                                width: 428.45

                                color: "transparent"

                                Text {
                                    id: human_Centric_Engineering

                                    height: 28
                                    width: 430

                                    color: "#e5e2e1"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 20
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 28
                                    lineHeightMode: Text.FixedHeight
                                    text: "Human-Centric Engineering"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                            Rectangle {
                                id: container_17

                                y: 40

                                height: 60
                                width: 428.45

                                color: "transparent"

                                Text {
                                    id: beyond_the_specs_we_design_for_the_user_experien

                                    height: 60
                                    width: 430

                                    color: "#c1c6d7"
                                    font.family: "Inter"
                                    font.pixelSize: 14
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 20
                                    lineHeightMode: Text.FixedHeight
                                    text: "Beyond the specs, we design for the user experience. Thermal\nmanagement and acoustic optimization are treated as art forms\nto ensure focus and flow."
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                    wrapMode: Text.Wrap
                                }
                            }
                        }
                    }
                    Rectangle {
                        id: mission_Card

                        height: 299.75
                        width: 738.67

                        clip: true
                        color: "#1c1b1b"
                        radius: 4

                        Image {
                            id: overlay_Blur

                            x: 562.66
                            y: -80

                            source: Qt.resolvedUrl("assets/overlay_Blur_2.png")
                        }
                        Rectangle {
                            id: container_18

                            x: 48
                            y: 48

                            height: 203.75
                            width: 642.67

                            color: "transparent"

                            Image {
                                id: icon_2

                                x: 3.08
                                y: 5.04

                                source: Qt.resolvedUrl("assets/icon_30.png")
                            }
                            Rectangle {
                                id: heading_7

                                y: 64

                                height: 36
                                width: 642.66

                                color: "transparent"

                                Text {
                                    id: _text_7

                                    height: 36
                                    width: 182

                                    color: "#e5e2e1"
                                    font.family: "Space Grotesk"
                                    font.pixelSize: 30
                                    font.weight: Font.Bold
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 36
                                    lineHeightMode: Text.FixedHeight
                                    text: "THE MISSION"
                                    textFormat: Text.PlainText
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                            Rectangle {
                                id: container_19

                                y: 116

                                height: 88
                                width: 642.66

                                color: "transparent"

                                Text {
                                    id: _text_8

                                    height: 88
                                    width: 636

                                    color: "#c1c6d7"
                                    font.family: "Inter"
                                    font.pixelSize: 18
                                    font.weight: Font.Normal
                                    horizontalAlignment: Text.AlignLeft
                                    lineHeight: 29.25
                                    lineHeightMode: Text.FixedHeight
                                    text: "To engineer the most visually stunning and technologically advanced\nhardware on the planet, empowering humanity to build the next iteration of\nthe digital world."
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
            id: stats_Section

            y: 2750.75

            height: 264
            width: 1280

            color: "#171717"

            Rectangle {
                id: container_20

                x: 80
                y: 96

                height: 72
                width: 1120

                color: "transparent"

                Rectangle {
                    id: container_21

                    height: 72
                    width: 244

                    color: "transparent"

                    Rectangle {
                        id: container_22

                        height: 48
                        width: 244

                        color: "transparent"

                        Text {
                            id: _text_9

                            x: 66.98

                            height: 48
                            width: 112

                            color: "#fabd00"
                            font.family: "Space Grotesk"
                            font.pixelSize: 48
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 48
                            lineHeightMode: Text.FixedHeight
                            text: "12K+"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Rectangle {
                        id: container_23

                        y: 56

                        height: 16
                        width: 244

                        color: "transparent"
                        opacity: 0.50

                        Text {
                            id: _text_10

                            x: 70.38

                            height: 16
                            width: 106

                            color: "#e5e2e1"
                            font.capitalization: Font.AllUppercase
                            font.family: "Inter"
                            font.letterSpacing: 1.20
                            font.pixelSize: 12
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 16
                            lineHeightMode: Text.FixedHeight
                            text: "Units Forged"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
                Rectangle {
                    id: container_24

                    x: 292

                    height: 72
                    width: 244

                    color: "transparent"

                    Rectangle {
                        id: container_25

                        height: 48
                        width: 244

                        color: "transparent"

                        Text {
                            id: _text_11

                            x: 52.44

                            height: 48
                            width: 141

                            color: "#fabd00"
                            font.family: "Space Grotesk"
                            font.pixelSize: 48
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 48
                            lineHeightMode: Text.FixedHeight
                            text: "99.9%"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Rectangle {
                        id: container_26

                        y: 56

                        height: 16
                        width: 244

                        color: "transparent"
                        opacity: 0.50

                        Text {
                            id: _text_12

                            x: 51.48

                            height: 16
                            width: 144

                            color: "#e5e2e1"
                            font.capitalization: Font.AllUppercase
                            font.family: "Inter"
                            font.letterSpacing: 1.20
                            font.pixelSize: 12
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 16
                            lineHeightMode: Text.FixedHeight
                            text: "Uptime Reliability"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
                Rectangle {
                    id: container_27

                    x: 584

                    height: 72
                    width: 244

                    color: "transparent"

                    Rectangle {
                        id: container_28

                        height: 48
                        width: 244

                        color: "transparent"

                        Text {
                            id: _text_13

                            x: 92.33

                            height: 48
                            width: 61

                            color: "#fabd00"
                            font.family: "Space Grotesk"
                            font.pixelSize: 48
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 48
                            lineHeightMode: Text.FixedHeight
                            text: "45"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Rectangle {
                        id: container_29

                        y: 56

                        height: 16
                        width: 244

                        color: "transparent"
                        opacity: 0.50

                        Text {
                            id: _text_14

                            x: 64.56

                            height: 16
                            width: 118

                            color: "#e5e2e1"
                            font.capitalization: Font.AllUppercase
                            font.family: "Inter"
                            font.letterSpacing: 1.20
                            font.pixelSize: 12
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 16
                            lineHeightMode: Text.FixedHeight
                            text: "Design Awards"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
                Rectangle {
                    id: container_30

                    x: 876

                    height: 72
                    width: 244

                    color: "transparent"

                    Rectangle {
                        id: container_31

                        height: 48
                        width: 244

                        color: "transparent"

                        Text {
                            id: _text_15

                            x: 70.25

                            height: 48
                            width: 105

                            color: "#fabd00"
                            font.family: "Space Grotesk"
                            font.pixelSize: 48
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 48
                            lineHeightMode: Text.FixedHeight
                            text: "24/7"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Rectangle {
                        id: container_32

                        y: 56

                        height: 16
                        width: 244

                        color: "transparent"
                        opacity: 0.50

                        Text {
                            id: _text_16

                            x: 46.77

                            height: 16
                            width: 153

                            color: "#e5e2e1"
                            font.capitalization: Font.AllUppercase
                            font.family: "Inter"
                            font.letterSpacing: 1.20
                            font.pixelSize: 12
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            lineHeight: 16
                            lineHeightMode: Text.FixedHeight
                            text: "Concierge Support"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }
        Rectangle {
            id: cTA_Section

            y: 3014.75

            height: 518
            width: 1280

            clip: true
            color: "transparent"

            Rectangle {
                id: overlay

                height: 518
                width: 1280

                color: "#0dfabd00"
            }
            Rectangle {
                id: container_33

                x: 256
                y: 128

                height: 262
                width: 768

                color: "transparent"

                Rectangle {
                    id: heading_8

                    height: 96
                    width: 768

                    color: "transparent"

                    Text {
                        id: _text_17

                        x: 95.27

                        height: 96
                        width: 579

                        color: "#e5e2e1"
                        font.family: "Space Grotesk"
                        font.pixelSize: 48
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignHCenter
                        lineHeight: 48
                        lineHeightMode: Text.FixedHeight
                        text: "READY TO UPGRADE YOUR\nREALITY?"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: container_34

                    y: 128

                    height: 28
                    width: 768

                    color: "transparent"

                    Text {
                        id: _text_18

                        x: 1.87

                        height: 28
                        width: 766

                        color: "#c1c6d7"
                        font.family: "Inter"
                        font.pixelSize: 18
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignHCenter
                        lineHeight: 28
                        lineHeightMode: Text.FixedHeight
                        text: "Join the elite rank of Monolith owners and experience computing as it was intended to be."
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: container_35

                    y: 188

                    height: 74
                    width: 768

                    color: "transparent"

                    Image {
                        id: button

                        x: 56.56
                        y: -14

                        source: Qt.resolvedUrl("assets/button.png")
                    }
                    Image {
                        id: button_1

                        x: 394.04
                        y: 16

                        source: Qt.resolvedUrl("assets/button_1.png")
                    }
                }
            }
        }
    }
    Rectangle {
        id: footer

        y: 3532.75

        height: 248
        width: 1280

        color: "#0a0a0a"

        Rectangle {
            id: container_36

            y: 80

            height: 128
            width: 1280

            color: "transparent"

            Text {
                id: _text_19

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
                id: _margin

                x: 286.17
                y: 28

                height: 52
                width: 707.65

                color: "transparent"

                Rectangle {
                    id: container_37

                    y: 32

                    height: 20
                    width: 707.65

                    color: "transparent"

                    Rectangle {
                        id: link

                        height: 20
                        width: 92.58

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_20

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

                        x: 124.58

                        height: 20
                        width: 112.77

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_21

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

                        x: 269.35

                        height: 20
                        width: 108.80

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_22

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

                        x: 410.15

                        height: 20
                        width: 58.05

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_23

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

                        x: 500.20

                        height: 20
                        width: 50.98

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_24

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

                        x: 583.18

                        height: 20
                        width: 124.47

                        color: "transparent"
                        opacity: 0.80

                        Text {
                            id: _text_25

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
                id: _margin_1

                x: 468.19
                y: 80

                height: 48
                width: 343.63

                color: "transparent"

                Rectangle {
                    id: container_38

                    y: 32

                    height: 16
                    width: 343.63

                    color: "transparent"

                    Text {
                        id: _text_26

                        height: 16
                        width: 345

                        color: "#737373"
                        font.family: "Inter"
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

        source: Qt.resolvedUrl("assets/topNavBar_4.png")
    }
}