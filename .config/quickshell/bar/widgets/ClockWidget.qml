import Quickshell
import QtQuick

Item {
    id: clockWidget
    width: 160
    height: 35

    SystemClock {
        id: systemClock
        precision: SystemClock.Seconds
    }

    Text {
    anchors.centerIn: parent
    text: Qt.formatDateTime(systemClock.date, "hh:mm  -  MM/dd/yyyy")
    font.pixelSize: clockWidget.height * 0.45
    color: "#FFFFFF"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    renderType: Text.NativeRendering
    }
}