import QtQuick
import QtQuick.Layouts
import Quickshell

import ".."

Rectangle {
	id: time_island
	color: Theme.mainbg
	radius: 12
	border.color: Theme.mainbr
	border.width: 1
	Layout.margins: 3

	implicitWidth: reloj.implicitWidth + 16
	implicitHeight: 24

	Timer {
		interval: 1000
		running: true
		repeat: true
		triggeredOnStart: true

		onTriggered: reloj.text = Qt.formatDateTime (new Date(), "hh:mm AP")
	}

	Text {
		id: reloj
		anchors.centerIn: parent

		color: Theme.changli
		font{
			family: "FiraCode Nerd Font"
			pixelSize: 13
			bold: true
		}
	}

	MouseArea {
		anchors.fill: parent
		onClicked: Quickshell.execDetached(["swaync-client", "-t", "-sw"])
	}
}
