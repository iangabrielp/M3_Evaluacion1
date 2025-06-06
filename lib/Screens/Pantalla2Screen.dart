import 'package:evaluacion_1/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla 2"),),
      body: Text("SCREEN 2"),
      drawer: MiDrawer(),
    );
  }
}