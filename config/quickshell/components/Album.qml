import QtQuick
import Quickshell
import QtQuick.Controls

import ".."

PanelWindow {
	id: window
	implicitWidth: 400
	implicitHeight: 600

	color: Theme.mainbg
	Image {
		id: album

		anchors.top: parent.top
		anchors.left: parent.left
		anchors.right: parent.right

		anchors.topMargin: 20
		anchors.leftMargin: 20
		anchors.rightMargin: 20

		fillMode: Image.PreserveAspectFit
		height: width

		source: "/tmp/album"
	}

	Slider{
		from: 0
		value: 33
		to: 100
	}
}
