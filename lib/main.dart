
import 'package:evaluacion_1/Screens/Pantalla1Screen.dart';
import 'package:evaluacion_1/Screens/Pantalla2Screen.dart';
import 'package:evaluacion_1/Screens/Pantalla3Screen.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(Ejercicios02App());
}

class Ejercicios02App extends StatelessWidget {
  const Ejercicios02App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MOVILES III"),
      actions: [IconButton(onPressed: ()=> mensajeCreditos(context), icon: Icon(Icons.text_snippet))],),
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage( 
            fit: BoxFit.cover,
            image: AssetImage("assets/images/fondo.jpg")),
            
        ),


        child: Center(
          child: Text("EVALUACION 1 - MOVILES III",
          style:TextStyle(color: Color.fromRGBO(245, 246, 248, 1)) ,))),
          drawer: Drawer(
        child: ListView(children: [
          ListTile(
            title: Text("Ejercicio 1"),
            onTap: () => 
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Pantalla1())),
          ),
          ListTile(
            title: Text("Ejercicio 2"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Pantalla2())),
          ),
          ListTile(
            title: Text("Ejercicio 3"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Pantalla3())),
          )
        ],),
      ),
    );
  }
}

void mensajeCreditos(context){
showDialog(context: context, builder: (context)=>
AlertDialog(
  title: Center(child: Center(child: Text("Ejercicios de Programacion"))),
  content: Column(
    children: [
      Center(child: Text("Programador: Gabriel Proaño")),
      Center(child: Text("Carrera:Desarrollo de Software"))
    ],
  ),
  
)
);
}