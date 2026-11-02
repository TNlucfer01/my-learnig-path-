import QtQuick
import QtQuick.Shapes

Rectangle {
    id: contact_Page_Electronics_Shop

    height: 1819
    width: 1280

    color: "#131313"

    Image {
        id: background_Accent_Decorative_Element

        x: 660
        y: 789.50

        source: Qt.resolvedUrl("assets/background_Accent_Decorative_Element.png")
    }
    Image {
        id: overlay_Blur

        x: -100
        y: 1419

        source: Qt.resolvedUrl("assets/overlay_Blur.png")
    }
    Rectangle {
        id: main

        height: 1554.50
        width: 1280

        color: "transparent"

        Rectangle {
            id: hero_Section

            x: 48
            y: 128

            height: 339
            width: 1184

            color: "transparent"

            Rectangle {
                id: overlay_Border

                height: 25
                width: 211.23

                border.color: "#33bdf4ff"
                border.width: 1
                color: "#1a00e3fd"
                radius: 2

                Text {
                    id: _text

                    x: 13
                    y: 5

                    height: 15
                    width: 189

                    color: "#bdf4ff"
                    font.capitalization: Font.AllUppercase
                    font.family: "Inter"
                    font.letterSpacing: 2
                    font.pixelSize: 10
                    font.weight: Font.Bold
                    horizontalAlignment: Text.AlignLeft
                    lineHeight: 15
                    lineHeightMode: Text.FixedHeight
                    text: "Protocol Status: Active"
                    textFormat: Text.PlainText
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                }
            }
            Rectangle {
                id: heading_1

                y: 49

                height: 174
                width: 1184

                color: "transparent"

                Image {
                    id: direct_Access_Protocols

                    source: Qt.resolvedUrl("assets/direct_Access_Protocols.png")
                }
            }
            Rectangle {
                id: container

                y: 247

                height: 92
                width: 672

                color: "transparent"

                Text {
                    id: _text_1

                    y: 8

                    height: 84
                    width: 655

                    color: "#c1c6d7"
                    font.family: "Inter"
                    font.pixelSize: 20
                    font.weight: Font.Light
                    horizontalAlignment: Text.AlignLeft
                    lineHeight: 28
                    lineHeightMode: Text.FixedHeight
                    text: "Connect with our engineering ensemble through secure channels.\nWhether technical integration or aesthetic consultation, our response\nmatrices are standing by."
                    textFormat: Text.PlainText
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.Wrap
                }
            }
        }
        Rectangle {
            id: section_Action_Cards_Grid

            x: 48
            y: 563

            height: 400
            width: 1184

            color: "transparent"

            Rectangle {
                id: whatsApp_Card

                height: 400
                width: 373.33

                clip: true
                color: "#1c1b1b"

                Rectangle {
                    id: _margin

                    x: 32
                    y: 32

                    height: 78
                    width: 309.33

                    color: "transparent"

                    Rectangle {
                        id: container_1

                        height: 30
                        width: 309.33

                        color: "transparent"

                        Image {
                            id: icon

                            source: Qt.resolvedUrl("assets/icon.png")
                        }
                    }
                }
                Rectangle {
                    id: _margin_1

                    x: 32
                    y: 120

                    height: 248
                    width: 309.33

                    color: "transparent"

                    Rectangle {
                        id: container_2

                        y: 52.20

                        height: 195.80
                        width: 309.33

                        color: "transparent"

                        Rectangle {
                            id: heading_3

                            height: 32
                            width: 309.33

                            color: "transparent"

                            Text {
                                id: whatsApp

                                height: 32
                                width: 311

                                color: "#e5e2e1"
                                font.family: "Space Grotesk"
                                font.pixelSize: 24
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 32
                                lineHeightMode: Text.FixedHeight
                                text: "WhatsApp"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_3

                            y: 46.80

                            height: 86.20
                            width: 309.33

                            color: "transparent"

                            Text {
                                id: real_time_encrypted_communication_with_our_deplo

                                height: 69
                                width: 311

                                color: "#c1c6d7"
                                font.family: "Inter"
                                font.pixelSize: 14
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 22.75
                                lineHeightMode: Text.FixedHeight
                                text: "Real-time encrypted communication with our\ndeployment specialists for immediate query\nresolution."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: link

                            y: 147.80

                            height: 48
                            width: 309.33

                            color: "#bdf4ff"
                            radius: 12

                            Text {
                                id: _text_2

                                x: 103.72
                                y: 16

                                height: 16
                                width: 105

                                color: "#001f24"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.letterSpacing: 1.20
                                font.pixelSize: 12
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignHCenter
                                lineHeight: 16
                                lineHeightMode: Text.FixedHeight
                                text: "Initiate Chat"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
                Shape {
                    id: gradient

                    height: 4
                    width: 373.33

                    opacity: 0

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
                                color: "#00bdf4ff"
                                position: 0
                            }
                            GradientStop {
                                color: "#ffbdf4ff"
                                position: 0.50
                            }
                            GradientStop {
                                color: "#00bdf4ff"
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
                id: email_Card

                x: 405.33

                height: 400
                width: 373.33

                clip: true
                color: "#1c1b1b"

                Rectangle {
                    id: _margin_2

                    x: 32
                    y: 32

                    height: 78
                    width: 309.33

                    color: "transparent"

                    Rectangle {
                        id: container_4

                        height: 30
                        width: 309.33

                        color: "transparent"

                        Image {
                            id: icon_1

                            source: Qt.resolvedUrl("assets/icon_1.png")
                        }
                    }
                }
                Rectangle {
                    id: _margin_3

                    x: 32
                    y: 120

                    height: 248
                    width: 309.33

                    color: "transparent"

                    Rectangle {
                        id: container_5

                        y: 52.20

                        height: 195.80
                        width: 309.33

                        color: "transparent"

                        Rectangle {
                            id: heading_4

                            height: 32
                            width: 309.33

                            color: "transparent"

                            Text {
                                id: email

                                height: 32
                                width: 311

                                color: "#e5e2e1"
                                font.family: "Space Grotesk"
                                font.pixelSize: 24
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 32
                                lineHeightMode: Text.FixedHeight
                                text: "Email"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_6

                            y: 46.80

                            height: 86.20
                            width: 309.33

                            color: "transparent"

                            Text {
                                id: detailed_technical_dossiers_and_business_inquiri

                                height: 69
                                width: 311

                                color: "#c1c6d7"
                                font.family: "Inter"
                                font.pixelSize: 14
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 22.75
                                lineHeightMode: Text.FixedHeight
                                text: "Detailed technical dossiers and business\ninquiries handled through our asynchronous\ndata pipelines."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Shape {
                            id: link_1

                            y: 147.80

                            height: 48
                            width: 309.33

                            ShapePath {
                                id: link_1ShapePath

                                strokeColor: "#000"
                                strokeWidth: 0

                                fillGradient: LinearGradient {
                                    id: gradientNode_1
                                
                                    x1: link_1.width * 0.47648717173400773
                                    x2: link_1.width * 0.5235128328358488
                                    y1: link_1.height * -0.47648717173400806
                                    y2: link_1.height * 1.4764871671641508
                                
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
                                    id: link_1PathRectangle

                                    x: 0
                                    y: 0

                                    height: link_1.height
                                    width: link_1.width

                                    radius: 12
                                }
                            }
                            Text {
                                id: _text_3

                                x: 97.76
                                y: 16

                                height: 16
                                width: 117

                                color: "#3f2e00"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.letterSpacing: 1.20
                                font.pixelSize: 12
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignHCenter
                                lineHeight: 16
                                lineHeightMode: Text.FixedHeight
                                text: "Transmit Data"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
                Shape {
                    id: gradient_1

                    height: 4
                    width: 373.33

                    opacity: 0

                    ShapePath {
                        id: gradient_1ShapePath

                        strokeColor: "#000"
                        strokeWidth: 0

                        fillGradient: LinearGradient {
                            id: gradientNode_2
                        
                            x1: gradient_1.width * 0
                            x2: gradient_1.width * 1
                            y1: gradient_1.height * 0.5
                            y2: gradient_1.height * 0.5
                        
                            GradientStop {
                                color: "#00fabd00"
                                position: 0
                            }
                            GradientStop {
                                color: "#fffabd00"
                                position: 0.50
                            }
                            GradientStop {
                                color: "#00fabd00"
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
            }
            Rectangle {
                id: location_Card

                x: 810.67

                height: 400
                width: 373.33

                clip: true
                color: "#1c1b1b"

                Rectangle {
                    id: _margin_4

                    x: 32
                    y: 32

                    height: 78
                    width: 309.33

                    color: "transparent"

                    Rectangle {
                        id: container_7

                        height: 30
                        width: 309.33

                        color: "transparent"

                        Image {
                            id: icon_2

                            source: Qt.resolvedUrl("assets/icon_2.png")
                        }
                    }
                }
                Rectangle {
                    id: _margin_5

                    x: 32
                    y: 120

                    height: 248
                    width: 309.33

                    color: "transparent"

                    Rectangle {
                        id: container_8

                        y: 50.20

                        height: 197.80
                        width: 309.33

                        color: "transparent"

                        Rectangle {
                            id: heading_5

                            height: 32
                            width: 309.33

                            color: "transparent"

                            Text {
                                id: showroom_Hub

                                height: 32
                                width: 311

                                color: "#e5e2e1"
                                font.family: "Space Grotesk"
                                font.pixelSize: 24
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 32
                                lineHeightMode: Text.FixedHeight
                                text: "Showroom Hub"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_9

                            y: 46.80

                            height: 86.20
                            width: 309.33

                            color: "transparent"

                            Text {
                                id: experience_the_Monolith_ecosystem_in_person_Our_

                                height: 69
                                width: 311

                                color: "#c1c6d7"
                                font.family: "Inter"
                                font.pixelSize: 14
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 22.75
                                lineHeightMode: Text.FixedHeight
                                text: "Experience the Monolith ecosystem in person.\nOur flagship sensory hub is located in the\narchitectural core."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: link_2

                            y: 147.80

                            height: 50
                            width: 309.33

                            border.color: "#338b90a0"
                            border.width: 1
                            color: "transparent"
                            radius: 12

                            Text {
                                id: _text_4

                                x: 91.16
                                y: 17

                                height: 16
                                width: 130

                                color: "#e5e2e1"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.letterSpacing: 1.20
                                font.pixelSize: 12
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignHCenter
                                lineHeight: 16
                                lineHeightMode: Text.FixedHeight
                                text: "Navigate to Hub"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
                Shape {
                    id: gradient_2

                    height: 4
                    width: 373.34

                    opacity: 0

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
                                color: "#00ffb595"
                                position: 0
                            }
                            GradientStop {
                                color: "#ffffb595"
                                position: 0.50
                            }
                            GradientStop {
                                color: "#00ffb595"
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
            }
        }
        Rectangle {
            id: bento_Section_Quote_Hours

            x: 48
            y: 1059

            height: 399.50
            width: 1184

            color: "transparent"

            Rectangle {
                id: hours_Section

                x: 729.60

                height: 400
                width: 454.40

                color: "#201f1f"

                Rectangle {
                    id: _margin_6

                    x: 40
                    y: 40

                    height: 60
                    width: 374.40

                    color: "transparent"

                    Rectangle {
                        id: container_10

                        height: 28
                        width: 374.40

                        color: "transparent"

                        Rectangle {
                            id: container_11

                            y: 4

                            height: 20
                            width: 20

                            color: "transparent"

                            Image {
                                id: icon_3

                                source: Qt.resolvedUrl("assets/icon_3.png")
                            }
                        }
                        Rectangle {
                            id: heading_2

                            x: 32

                            height: 28
                            width: 287.97

                            color: "transparent"

                            Text {
                                id: _text_5

                                height: 28
                                width: 290

                                color: "#e5e2e1"
                                font.capitalization: Font.AllUppercase
                                font.family: "Space Grotesk"
                                font.letterSpacing: 1
                                font.pixelSize: 20
                                font.weight: Font.Bold
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 28
                                lineHeightMode: Text.FixedHeight
                                text: "Technical Support Hours"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                }
                Rectangle {
                    id: container_12

                    x: 40
                    y: 100

                    height: 147
                    width: 374.40

                    color: "transparent"

                    Image {
                        id: horizontalBorder

                        source: Qt.resolvedUrl("assets/horizontalBorder.png")

                        Rectangle {
                            id: container_13

                            y: 4

                            height: 20
                            width: 132.33

                            color: "transparent"

                            Text {
                                id: _text_6

                                height: 20
                                width: 134

                                color: "#c1c6d7"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.pixelSize: 14
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 20
                                lineHeightMode: Text.FixedHeight
                                text: "Monday — Friday"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_14

                            x: 230.92

                            height: 24
                            width: 143.48

                            color: "transparent"

                            Text {
                                id: _text_7

                                height: 24
                                width: 145

                                color: "#9cf0ff"
                                font.family: "Space Grotesk"
                                font.pixelSize: 16
                                font.weight: Font.Medium
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 24
                                lineHeightMode: Text.FixedHeight
                                text: "08:00 — 22:00 PST"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                    Image {
                        id: horizontalBorder_1

                        y: 57

                        source: Qt.resolvedUrl("assets/horizontalBorder_1.png")

                        Rectangle {
                            id: container_15

                            y: 4

                            height: 20
                            width: 73.67

                            color: "transparent"

                            Text {
                                id: _text_8

                                height: 20
                                width: 75

                                color: "#c1c6d7"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.pixelSize: 14
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 20
                                lineHeightMode: Text.FixedHeight
                                text: "Saturday"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_16

                            x: 236.13

                            height: 24
                            width: 138.27

                            color: "transparent"

                            Text {
                                id: _text_9

                                height: 24
                                width: 140

                                color: "#9cf0ff"
                                font.family: "Space Grotesk"
                                font.pixelSize: 16
                                font.weight: Font.Medium
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 24
                                lineHeightMode: Text.FixedHeight
                                text: "10:00 — 18:00 PST"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                            }
                        }
                    }
                    Image {
                        id: horizontalBorder_2

                        y: 114

                        source: Qt.resolvedUrl("assets/horizontalBorder_2.png")

                        Rectangle {
                            id: container_17

                            y: 4

                            height: 20
                            width: 57.70

                            color: "transparent"

                            Text {
                                id: _text_10

                                height: 20
                                width: 59

                                color: "#c1c6d7"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.pixelSize: 14
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 20
                                lineHeightMode: Text.FixedHeight
                                text: "Sunday"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                        Rectangle {
                            id: container_18

                            x: 170.31

                            height: 24
                            width: 204.09

                            color: "transparent"

                            Text {
                                id: _text_11

                                height: 24
                                width: 206

                                color: "#fabd00"
                                font.family: "Space Grotesk"
                                font.pixelSize: 16
                                font.weight: Font.Medium
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 24
                                lineHeightMode: Text.FixedHeight
                                text: "Automated Response Only"
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
                Rectangle {
                    id: _margin_7

                    x: 40
                    y: 247

                    height: 113
                    width: 374.40

                    color: "transparent"

                    Rectangle {
                        id: overlay

                        y: 48

                        height: 65
                        width: 374.40

                        color: "#4d393939"
                        radius: 4

                        Rectangle {
                            id: container_19

                            x: 16
                            y: 16

                            height: 33
                            width: 342.40

                            color: "transparent"

                            Text {
                                id: priority_protocols_available_for_Platinum_Tier_s

                                height: 33
                                width: 343

                                color: "#c1c6d7"
                                font.capitalization: Font.AllUppercase
                                font.family: "Inter"
                                font.letterSpacing: -0.50
                                font.pixelSize: 10
                                font.weight: Font.Normal
                                horizontalAlignment: Text.AlignLeft
                                lineHeight: 16.25
                                lineHeightMode: Text.FixedHeight
                                text: "Priority protocols available for Platinum Tier subscribers\n24/7/365. Emergency bypass available via direct terminal access."
                                textFormat: Text.PlainText
                                verticalAlignment: Text.AlignVCenter
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
            }
            Image {
                id: quote_Section

                source: Qt.resolvedUrl("assets/quote_Section.png")

                Image {
                    id: icon_4

                    x: 43
                    y: 47

                    source: Qt.resolvedUrl("assets/icon_4.png")
                }
                Rectangle {
                    id: blockquote

                    x: 49
                    y: 104.75

                    height: 189.50
                    width: 600.60

                    color: "transparent"

                    Rectangle {
                        id: container_20

                        height: 150
                        width: 600.60

                        color: "transparent"

                        Text {
                            id: engineering_excellence_is_not_a_destination_but_

                            height: 150
                            width: 602

                            color: "#e5e2e1"
                            font.family: "Space Grotesk"
                            font.pixelSize: 30
                            font.weight: Font.Light
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 37.50
                            lineHeightMode: Text.FixedHeight
                            text: "\"Engineering excellence is not a\ndestination, but a continuous frequency\nof innovation that resonates through\nevery component we synthesize.\""
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                    Text {
                        id: cite_Lead_Systems_Architect_Monolith_Onyx_Divisi

                        y: 173.50

                        height: 16
                        width: 404

                        color: "#fabd00"
                        font.capitalization: Font.AllUppercase
                        font.family: "Inter"
                        font.letterSpacing: 1.20
                        font.pixelSize: 12
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 16
                        lineHeightMode: Text.FixedHeight
                        text: "— Lead Systems Architect, Monolith Onyx Division"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
            }
        }
    }
    Rectangle {
        id: footer

        y: 1554.50

        height: 255
        width: 1280

        color: "#171717"

        Rectangle {
            id: container_21

            height: 251
            width: 1280

            color: "transparent"

            Rectangle {
                id: container_22

                x: 48
                y: 64

                height: 123
                width: 362.67

                color: "transparent"

                Rectangle {
                    id: container_23

                    height: 28
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: mONOLITH_ELECTRONICS

                        height: 28
                        width: 363

                        color: "#ffffff"
                        font.family: "Space Grotesk"
                        font.letterSpacing: -0.90
                        font.pixelSize: 18
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignLeft
                        lineHeight: 28
                        lineHeightMode: Text.FixedHeight
                        text: "MONOLITH ELECTRONICS"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
                Rectangle {
                    id: container_24

                    y: 44

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: superior_audio_visual_architecture_for_the_moder

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
                        text: "Superior audio-visual architecture for the modern digital sanctuary."
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.Wrap
                    }
                }
            }
            Rectangle {
                id: container_25

                x: 458.67
                y: 64

                height: 123
                width: 362.67

                color: "transparent"

                Rectangle {
                    id: heading_4_margin

                    height: 28
                    width: 362.67

                    color: "transparent"

                    Rectangle {
                        id: heading_6

                        height: 20
                        width: 362.67

                        color: "transparent"

                        Text {
                            id: protocols

                            height: 20
                            width: 366

                            color: "#eab308"
                            font.capitalization: Font.AllUppercase
                            font.family: "Space Grotesk"
                            font.letterSpacing: 1.40
                            font.pixelSize: 14
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            text: "Protocols"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
                Rectangle {
                    id: link_3

                    y: 36

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: privacy_Policy

                        height: 16
                        width: 364

                        color: "#737373"
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
                    id: link_4

                    y: 60

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: terms_of_Service

                        height: 16
                        width: 364

                        color: "#737373"
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
                    id: link_5

                    y: 84

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: newsletter

                        height: 16
                        width: 364

                        color: "#737373"
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
                id: container_26

                x: 869.33
                y: 64

                height: 123
                width: 362.67

                color: "transparent"

                Rectangle {
                    id: heading_4_margin_1

                    height: 28
                    width: 362.67

                    color: "transparent"

                    Rectangle {
                        id: heading_7

                        height: 20
                        width: 362.67

                        color: "transparent"

                        Text {
                            id: social_Vectors

                            height: 20
                            width: 366

                            color: "#eab308"
                            font.capitalization: Font.AllUppercase
                            font.family: "Space Grotesk"
                            font.letterSpacing: 1.40
                            font.pixelSize: 14
                            font.weight: Font.Bold
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 20
                            lineHeightMode: Text.FixedHeight
                            text: "Social Vectors"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
                Rectangle {
                    id: link_6

                    y: 36

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: instagram

                        height: 16
                        width: 364

                        color: "#737373"
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
                    id: link_7

                    y: 60

                    height: 16
                    width: 362.67

                    color: "transparent"

                    Text {
                        id: linkedIn

                        height: 16
                        width: 364

                        color: "#737373"
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
                Rectangle {
                    id: _margin_8

                    y: 84

                    height: 39
                    width: 362.67

                    color: "transparent"

                    Rectangle {
                        id: container_27

                        y: 24

                        height: 15
                        width: 362.67

                        color: "transparent"

                        Text {
                            id: mONOLITH_ELECTRONICS_ALL_RIGHTS_RESERVED_

                            height: 15
                            width: 364

                            color: "#a3a3a3"
                            font.family: "Inter"
                            font.letterSpacing: -0.25
                            font.pixelSize: 10
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            lineHeight: 15
                            lineHeightMode: Text.FixedHeight
                            text: "© 2024 MONOLITH ELECTRONICS. ALL RIGHTS RESERVED."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }
        Rectangle {
            id: background

            y: 251

            height: 4
            width: 1280

            color: "#262626"
        }
    }
    Image {
        id: topNavBar

        source: Qt.resolvedUrl("assets/topNavBar.png")
    }
}