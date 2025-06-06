import 'package:evaluacion_1/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Pantalla1 extends StatelessWidget {
  const Pantalla1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EJERCICIO 1")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: Text("CÁLCULO DE GOTAS POR MINUTO", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
            SizedBox(height: 20),
            inputVolumen(),
            SizedBox(height: 10),
            inputTiempo(),
            SizedBox(height: 10),
            inputFactor(),
            SizedBox(height: 20),
            btnCalcularGotas(context),
          ],
        ),
      ),
      drawer: MiDrawer(),
    );
  }
}

// Controladores
TextEditingController _volumen = TextEditingController();
TextEditingController _tiempo = TextEditingController();
TextEditingController _factor = TextEditingController();

// Campos de entrada
Widget inputVolumen() {
  return TextField(
    controller: _volumen,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      label: Text("Volumen (ml)"),
      border: OutlineInputBorder(),
    ),
  );
}

Widget inputTiempo() {
  return TextField(
    controller: _tiempo,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      label: Text("Tiempo (horas)"),
      border: OutlineInputBorder(),
    ),
  );
}

Widget inputFactor() {
  return TextField(
    controller: _factor,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      label: Text("Factor de goteo"),
      border: OutlineInputBorder(),
    ),
  );
}

// Función de cálculo
double calcularGotas() {
  double volumen = double.parse(_volumen.text);
  double tiempo = double.parse(_tiempo.text);
  double factor = double.parse(_factor.text);

  if (tiempo == 0) {
    return -1;
  }

  return (volumen * factor) / (tiempo * 60);
}

// Botón para calcular
Widget btnCalcularGotas(context) {
  return FilledButton.icon(
    onPressed: () {
      double resultado = calcularGotas();
      if (resultado == -1) {
        mensajeError(context);
      } else {
        mensajeGotas(context, resultado);
      }
    },
    label: Text("Calcular Gotas/min"),
    icon: Icon(Icons.opacity),
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(3, 65, 19, 1)),
    ),
  );
}

// Mensaje de resultado
void mensajeGotas(context, double gotas) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Resultado"),
      content: Text("Las gotas por minuto son: ${gotas.toStringAsFixed(2)}"),
    ),
  );
}

// Mensaje de error
void mensajeError(context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Error"),
      content: Text("Error: el tiempo debe ser mayor a 0."),
    ),
  );
}
