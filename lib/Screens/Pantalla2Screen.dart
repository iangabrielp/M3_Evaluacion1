import 'package:evaluacion_1/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EJERCICIO 2")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("ENERGÍA CINÉTICA", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            inputMasa(),
            SizedBox(height: 10),
            inputVelocidad(),
            SizedBox(height: 20),
            btnCalcularEnergia(context),
          ],
        ),
      ),
      drawer: MiDrawer(),
    );
  }
}

// Controladores
TextEditingController _masa = TextEditingController();
TextEditingController _velocidad = TextEditingController();

// Campos de entrada
Widget inputMasa() {
  return TextField(
    controller: _masa,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      label: Text("Masa (kg)"),
      border: OutlineInputBorder(),
    ),
  );
}

Widget inputVelocidad() {
  return TextField(
    controller: _velocidad,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      label: Text("Velocidad (m/s)"),
      border: OutlineInputBorder(),
    ),
  );
}

// Función de cálculo
double calcularEnergia() {
  double masa = double.parse(_masa.text);
  double velocidad = double.parse(_velocidad.text);

  if (velocidad == 0) {
    return 0;
  }

  return 0.5 * masa * velocidad * velocidad;
}

// Botón para calcular
Widget btnCalcularEnergia(context) {
  return FilledButton.icon(
    onPressed: () {
      double energia = calcularEnergia();
      if (energia == 0) {
        mensajeReposo(context);
      } else {
        mensajeEnergia(context, energia);
      }
    },
    label: Text("Calcular Energía"),
    icon: Icon(Icons.bolt),
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(3, 65, 19, 1)),
    ),
  );
}

// Mensaje de resultado
void mensajeEnergia(context, double energia) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Resultado"),
      content: Text("La energía cinética es: ${energia.toStringAsFixed(2)} J"),
    ),
  );
}

// Mensaje si velocidad es cero
void mensajeReposo(context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Objeto en reposo"),
      content: Text("El objeto está en reposo (energía = 0)."),
    ),
  );
}
