import Quickshell
import QtQuick

import "widgets"

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 35
            color: "transparent"

            Rectangle {
                id: barBackground
                anchors.fill: parent
                radius: 10

                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#0F141E" }
                    GradientStop { position: 1.0; color: "#1A2030" }
                }

                Row {
                    id: leftSection
                    anchors {
                        left: parent.left
                        leftMargin: 10
                        verticalCenter: parent.verticalCenter
                    }
                    spacing: 10
                }

                Row {
                    id: centerSection
                    anchors.centerIn: parent
                    ClockWidget {}
                }

                Row {
                    id: rightSection
                    anchors {
                        right: parent.right
                        rightMargin: 10
                        verticalCenter: parent.verticalCenter
                    }
                    spacing: 10
                }
            }
        }
    }
}