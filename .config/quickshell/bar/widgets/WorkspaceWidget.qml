import Quickshell
import Quickshell.Hyprland
import QtQuick

Item {
    id: workspaceWidget
    width: workspaceRow.width
    height: 35
    visible: screenName === "DP-1"

    property string screenName: ""

    function isWorkspaceActive(id) {
        for (var i = 0; i < Hyprland.workspaces.values.length; i++) {
            var ws = Hyprland.workspaces.values[i];
            if (ws.name === id.toString() && ws.monitor && ws.monitor.name === screenName)
                return ws.active;
        }
        return false;
    }

    function workspaceExists(id) {
        for (var i = 0; i < Hyprland.workspaces.values.length; i++) {
            var ws = Hyprland.workspaces.values[i];
            if (ws.name === id.toString() && ws.monitor && ws.monitor.name === screenName)
                return true;
        }
        return false;
    }

    Row {
        id: workspaceRow
        spacing: 8
        anchors.verticalCenter: parent.verticalCenter

        Repeater {
            model: 9

            Item {
                width: 18
                height: 18
                property bool active: isWorkspaceActive(index + 1)
                property bool exists: workspaceExists(index + 1)

                Rectangle {
                    anchors.fill: parent
                    radius: width / 2
                    color: "transparent"
                    border.color: {
                        if (active)
                            return "#FFFFFF";
                        if (exists)
                            return "#6B7280";

                        return "#374151";
                    }
                    border.width: 2
                    antialiasing: true
                    smooth: true
                }

                Rectangle {
                    anchors.centerIn: parent
                    width: 10
                    height: 10
                    radius: 5
                    color: "#FFFFFF"
                    visible: active
                    antialiasing: true
                    smooth: true
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }
            }
        }
    }

    Connections {
        target: Hyprland.workspaces
        function onValuesChanged() {
            workspaceRow.childrenChanged();
        }
    }
}