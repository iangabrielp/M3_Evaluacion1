import 'package:evaluacion_1/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EJERCICIO 3")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("PRESIÓN EN UN LÍQUIDO", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            inputProfundidad(),
            SizedBox(height: 10),
            inputDensidad(),
            SizedBox(height: 10),
            inputGravedad(),
            SizedBox(height: 20),
            btnCalcularPresion(context),
          ],
        ),
      ),
      drawer: MiDrawer(),
    );
  }
}

// Controladores
TextEditingController _profundidad = TextEditingController();
TextEditingController _densidad = TextEditingController();
TextEditingController _gravedad = TextEditingController();

// Inputs
Widget inputProfundidad() {
  return TextField(
    controller: _profundidad,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      label: Text("Profundidad"),
      border: OutlineInputBorder(),
    ),
  );
}

Widget inputDensidad() {
  return TextField(
    controller: _densidad,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      label: Text("Densidad"),
      border: OutlineInputBorder(),
    ),
  );
}

Widget inputGravedad() {
  return TextField(
    controller: _gravedad,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      label: Text("Gravedad"),
      border: OutlineInputBorder(),
    ),
  );
}

// Cálculo
double calcularPresion() {
  double profundidad = double.parse(_profundidad.text);
  if (profundidad < 0) return -1;

  double densidad = _densidad.text.isEmpty ? 1000 : double.parse(_densidad.text);
  double gravedad = _gravedad.text.isEmpty ? 9.8 : double.parse(_gravedad.text);

  return densidad * gravedad * profundidad;
}

// Botón
Widget btnCalcularPresion(context) {
  return FilledButton.icon(
    onPressed: () {
      double presion = calcularPresion();
      if (presion == -1) {
        mensajeError(context);
      } else {
        mensajePresion(context, presion);
      }
    },
    label: Text("Calcular Presión"),
    icon: Icon(Icons.water_drop),
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(3, 65, 19, 1)),
    ),
  );
}

// Mensajes
void mensajePresion(context, double presion) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Resultado"),
      content: Text("La presión es: ${presion.toStringAsFixed(2)} Pa"),
    ),
  );
}

void mensajeError(context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Error"),
      content: Text("La profundidad no puede ser negativa."),
    ),
  );
}
