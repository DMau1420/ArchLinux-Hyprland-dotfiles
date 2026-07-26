import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import ".."

Rectangle {
	id: battery_island
	color: Theme.mainbg
	radius: 12
	border.color: Theme.mainbr
	Layout.margins: 3

	implicitWidth: battery.implicitWidth + 16
	implicitHeight: 24

	Process {
		id: batbash
		command: ["bash", "-c", Quickshell.shellPath("/components/scripts/battery.sh")]

		stdout: StdioCollector {
			id: collector
			onTextChanged: {
				let batout = collector.text.trim()
				if (batout !== "") {
					if (batout >= 80){
						battery.text = batout + "% "
						battery.color = "#16f87A"
					}else if (batout >= 60 ) {
						battery.text = batout + "% "
						battery.color = "#A3E635"
					}else if (batout >= 40) {
						battery.text = batout + "% "
						battery.color = "#FBBF24"
					}else if (batout >= 20) {
						battery.text = batout + "% "
						battery.color = "#F97316"
					}else {
						battery.text = batout + "% "
						battery.color = "#EF4444"
					}
                		}
			}		
		}
		stderr: StdioCollector {
            		onTextChanged: {
                		if (this.text.trim() !== "") {
                    		console.log("-> ERROR SCRIPT: " + this.text.trim())
                		}
            		}
        	}
    	}

	Timer {
		interval: 1000
		running: true
		repeat: true
		triggeredOnStart: true

		onTriggered: {
			batbash.running = false
			Qt.callLater (() => {
				batbash.running = true
			})
		}
	}

	Text {
		id: battery
		anchors.centerIn: parent

		color: "#16F87A"
		font {
			family: "FiraCode Nerd Font"
			pixelSize: 13
		}
	}
}
