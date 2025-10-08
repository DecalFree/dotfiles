import Quickshell
import QtQuick

Item {
    id: clockWidget
    width: 160
    height: 35

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    Text {
    anchors.centerIn: parent
    text: Qt.formatDateTime(clock.date, "hh:mm  -  yyyy-MM-dd")
    font.family: "JetBrains Mono"
    font.pixelSize: clockWidget.height * 0.45
    color: "#FFFFFF"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    renderType: Text.NativeRendering
}
}