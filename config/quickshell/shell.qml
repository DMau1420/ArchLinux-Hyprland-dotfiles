import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland // Para los workspaces

ShellRoot {
    // --- PALETA DE COLORES (Maulinux Theme) ---
    readonly property color obsidianBg: "#1e1e2e" 
    readonly property color cristalBorder: "#ffffff"
    readonly property color lilaAcheron: "#8c8bc2"
    readonly property color rosaChangli: "#fca29a"
    readonly property color mentaAnaxa: "#94e2d5"
    readonly property color nieveTexto: "#cdd6f4"

    PanelWindow {
        anchors { top: true; left: true; right: true }
        height: 46
        color: "transparent"

        // --- CONTENEDOR PRINCIPAL ---
        RowLayout {
            anchors.fill: parent
            anchors.margins: 4
            spacing: 0

            // --- SECCIÓN IZQUIERDA ---
            RowLayout {
                Layout.alignment: Qt.AlignLeft
                spacing: 6

                // Launcher
                Rectangle {
                    width: 40; height: 34
                    color: obsidianBg; radius: 10
                    border.color: cristalBorder; border.width: 1
                    Text { 
                        anchors.centerIn: parent; text: "󰣇"
                        font.pixelSize: 18; color: "#cba6f7" 
                    }
                    MouseArea { 
                        anchors.fill: parent
                        onClicked: Quickshell.execute(["wofi", "--show", "drun"]) 
                    }
                }

                // Workspaces (Dinámicos)
                Rectangle {
                    height: 34; Layout.preferredWidth: 100
                    color: obsidianBg; radius: 10
                    border.color: cristalBorder; border.width: 1
                    Row {
                        anchors.centerIn: parent; spacing: 8
                        Text { text: "󰨇"; color: rosaChangli; font.pixelSize: 14 }
                        Text { text: "1"; color: nieveTexto; font.pixelSize: 14 }
                    }
                }

                // Tu Pixel Art Animado
                AnimatedImage {
                    source: "file:///home/maulinux/Downloads/tu_pixelart.gif"
                    width: 32; height: 32
                    Layout.alignment: Qt.AlignVCenter
                }
            }

            // --- SECCIÓN CENTRO (Media Player) ---
            RowLayout {
                Layout.alignment: Qt.AlignCenter
                spacing: 0

                Process {
                    id: mediaScript
                    command: ["python", "/home/maulinux/.config/Scrips/mediaplayer.py"]
                    running: true
                    stdout: Process.LineLines
                }

                Rectangle {
                    height: 34; Layout.preferredWidth: 200
                    color: obsidianBg; radius: 10
                    border.color: cristalBorder; border.width: 1
                    clip: true
                    
                    Row {
                        anchors.centerIn: parent; spacing: 12
                        
                        // Previous
                        Text { 
                            text: "󰒮"; color: nieveTexto
                            MouseArea { anchors.fill: parent; onClicked: Quickshell.execute(["playerctl", "previous"]) }
                        }

                        // Info Canción
                        Text {
                            text: mediaScript.stdout.trim() || "Maulinux Music"
                            color: "#89b4fa"; font.pixelSize: 12
                            width: 120; elide: Text.ElideRight; horizontalAlignment: Text.AlignHCenter
                        }

                        // Play/Pause
                        Text { 
                            text: "󰏤"; color: mentaAnaxa
                            MouseArea { anchors.fill: parent; onClicked: Quickshell.execute(["playerctl", "play-pause"]) }
                        }

                        // Next
                        Text { 
                            text: "󰒭"; color: nieveTexto
                            MouseArea { anchors.fill: parent; onClicked: Quickshell.execute(["playerctl", "next"]) }
                        }
                    }
                }
            }

            // --- SECCIÓN DERECHA ---
            RowLayout {
                Layout.alignment: Qt.AlignRight
                spacing: 6

                // CPU & RAM (Agrupados)
                Rectangle {
                    height: 34; Layout.preferredWidth: 120
                    color: obsidianBg; radius: 10
                    border.color: cristalBorder; border.width: 1
                    
                    Row {
                        anchors.centerIn: parent; spacing: 10
                        Text { text: " 10%"; color: lilaAcheron; font.pixelSize: 11 }
                        Text { text: " 25%"; color: "#b4befe"; font.pixelSize: 11 }
                    }
                }

                // Reloj (Tu color Rosa Changli)
                Rectangle {
                    height: 34; Layout.preferredWidth: 90
                    color: obsidianBg; radius: 10
                    border.color: cristalBorder; border.width: 1
                    Text {
                        id: timeText
                        anchors.centerIn: parent
                        color: rosaChangli; font.weight: Font.Bold
                        text: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })
                        Timer {
                            interval: 60000; running: true; repeat: true
                            onTriggered: timeText.text = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })
                        }
                    }
                }
            }
        }
    }
}