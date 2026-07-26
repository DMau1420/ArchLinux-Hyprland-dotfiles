import QtQuick
import QtQuick.Shapes

Item {
    width: 200
    height: 220 // Un poco más alto para dejar espacio al texto de abajo

    // Propiedades simuladas (aquí conectarás tus datos de quickshell)
    property real cpuUsage: 0.65       // Valor de 0.0 a 1.0 (65%)
    property int temperature: 95       // Temperatura en grados Celsius

    // 1. Gráfica de Arco (Estilo Acelerómetro)
    Shape {
        id: gauge
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        width: 180
        height: 180
        
        // Habilitar antialiasing para que las curvas se vean perfectas
        layer.enabled: true
        layer.samples: 4

        // Arco de fondo (Gris/Oscuro)
        ShapePath {
            fillColor: "transparent"
            strokeColor: "#2a2a2a"
            strokeWidth: 14
            capStyle: ShapePath.RoundCap // Bordes redondeados en las puntas

            PathAngleArc {
                centerX: 90; centerY: 90
                radiusX: 75; radiusY: 75
                startAngle: 140  // Ángulo de inicio (estilo velocímetro)
                sweepAngle: 260  // Qué tanto se extiende el arco completo
            }
        }

        // Arco de progreso dinámico (Uso del sistema)
        ShapePath {
            fillColor: "transparent"
            // Cambia a color rojo si pasa del 85% de uso
            strokeColor: cpuUsage > 0.85 ? "#ff3333" : "#00ffcc"
            strokeWidth: 14
            capStyle: ShapePath.RoundCap

            PathAngleArc {
                centerX: 90; centerY: 90
                radiusX: 75; radiusY: 75
                startAngle: 140
                // El arco crece proporcionalmente al valor de cpuUsage
                sweepAngle: 260 * cpuUsage
            }
        }
    }

    // Texto central dentro del arco (Porcentaje de Uso)
    Text {
        anchors.centerIn: gauge
        text: Math.round(cpuUsage * 100) + "%"
        color: "#ffffff"
        font.pixelSize: 28
        font.bold: true
    }

    // 2. Información Inferior (Temperatura)
    Text {
        anchors.top: gauge.bottom
        anchors.topMargin: -10 // Ajuste fino de posición
        anchors.horizontalCenter: parent.horizontalCenter
        text: temperature + "°C"
        // Si se calienta demasiado, el texto se vuelve naranja/rojo
        color: temperature > 75 ? "#ff9900" : "#aaaaaa"
        font.pixelSize: 20
    }
}
