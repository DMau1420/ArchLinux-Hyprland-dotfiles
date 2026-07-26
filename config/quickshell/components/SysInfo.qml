import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import ".."

Rectangle {
	id: sysinfo_island
	color: Theme.mainbg
	radius: 12
	border.color: Theme.mainbr
	Layout.margins: 3	

	implicitWidth: sys_layout.implicitWidth + 16
	implicitHeight: 24

	Process {
		id: sysinfo
		command: [Quickshell.shellPath("components/scripts/system_info")]

		stdout: StdioCollector {
            		id: collector
            		onTextChanged: {
				let full_text = collector.text.trim()
				console.log(full_text)
				if (full_text !== "") {
					let lines = full_text.split("\n")
					let last_json = lines[lines.length - 1].trim()
					if (last_json !== ""){
        					try {
	            					let data = JSON.parse(last_json)
                            				cpu_txt.text = data.cpu.uso + "% " 
                            				gpu_txt.text = data.gpu.uso + "% 󰢮"
                            				ram_txt.text = data.ram.porcent + "% "
                        			} catch(e) {
							console.log("Error parseando JSON: " + e)
                        			}
                    			}
                		}
            		}
		}

		stderr: StdioCollector {
			id: error_collector
            		onTextChanged: {
                		if (error_collector.text.trim() !== "") {
                    		console.log("-> ERROR DAEMON: " + error_collector.text.trim())
				}
			}
        	}
	}

	RowLayout{
		id: sys_layout
		anchors.centerIn: parent
		spacing: 12

		Text {
			id: cpu_txt
			text: "cpu"
			color: "#ffffff"

			font {
				family: "FiraCode Nerd Font"
				pixelSize: 13
			}
		}

		Text {
			id: gpu_txt
			text: "gpu"
			color: "#33aa33"

			font {
				family: "FiraCode Nerd Font"
				pixelSize: 13
			}
		}

		Text {
			id: ram_txt
			text: "ram"
			color: "#b00b69"

			font {
				family: "FiraCode Nerd Font"
				pixelSize: 13
			}
		}
	}


}
