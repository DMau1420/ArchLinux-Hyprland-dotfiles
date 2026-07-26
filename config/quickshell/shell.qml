import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import "./components"

PanelWindow {
	id: mainBar
	anchors.top:true
	anchors.left: true
	anchors.right: true
	implicitHeight: 27
	color: "transparent"		

	RowLayout {
		anchors.fill: parent
		spacing: 0

		Workspaces {}

		Item { Layout.fillWidth: true}

		SysInfo {}

		Battery {}

		Time {}

	}
}
