import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Io

import ".."

RowLayout {
	id: workspace_bar
    	spacing: 0

	implicitWidth: launcher_island.implicitWidth + workspaces_island.implicitWidth
    	implicitHeight: 27
	
	Process {
        	id: logoutProcess
        	command: ["wlogout", "-b", "6", "-T", "400", "-B", "400"]
    	}

    	Rectangle {
        	id: launcher_island
        	color: Theme.mainbg
		radius: 12
        	border.color: Theme.mainbr
        	border.width: 1
		Layout.margins: 3

        	implicitWidth: launcher_icon.implicitWidth + 16
        	implicitHeight: 24

        	Text {
            		id: launcher_icon
            		anchors.centerIn: parent
            		text: "󰣇"
            		color: Theme.castorice
            		font { family: "FiraCode Nerd Font"; pixelSize: 14 }
        	}

        	MouseArea {
            		anchors.fill: parent
            		onClicked: logoutProcess.startDetached()
        	}
    	}

    	Rectangle {        
        	id: workspaces_island
       		color: Theme.mainbg
        	radius: 12
        	border.color: Theme.mainbr
        	border.width: 1
        	Layout.margins: 3

        	implicitWidth: wsRow.implicitWidth + 12
        	implicitHeight: 24

        	Row {
            		id: wsRow
            		anchors.centerIn: parent
            		spacing: 4 

            		Repeater {
				model: Hyprland.workspaces.values

				Rectangle{
					id: active_workspace	
					
					property var ws: modelData
                    			property bool isActive: Hyprland.focusedWorkspace?.id === ws.id

					radius: 8
					color: isActive ? Theme.wsbg: "transparent"

					implicitWidth: wsText.implicitWidth + 16
					implicitHeight: 20
					anchors.verticalCenter: parent.verticalCenter

                			Text {
						id: wsText
						anchors.centerIn: parent

                    				text: (active_workspace.isActive ? "󰨇 " : "󰍹 ") + active_workspace.ws.id
                    				color: active_workspace.isActive ? Theme.cherry : Theme.inactws
                    				font { family: "FiraCode Nerd Font"; pixelSize: 13; bold: active_workspace.isActive }
            
                    				MouseArea {
                        				anchors.fill: parent
                        				onClicked: active_workspace.ws.activate()
                    				}
					}
				}
            		}
        	}
    	}
}
