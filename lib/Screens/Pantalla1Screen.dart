
import 'package:evaluacion_1/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Pantalla1 extends StatelessWidget {
  const Pantalla1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PANTALLA 1"),),
      body: Center(child: Text("SCREEN 1")),
      drawer: MiDrawer()
    );
  }
}