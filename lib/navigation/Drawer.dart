

import 'package:evaluacion_1/Screens/Pantalla1Screen.dart';
import 'package:evaluacion_1/Screens/Pantalla2Screen.dart';
import 'package:evaluacion_1/Screens/Pantalla3Screen.dart';
import 'package:evaluacion_1/main.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [

        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Column(
            children: [
              Text("Home"),
              Expanded(child: Image.asset("assets/images/logo.png",)),
              TextButton(onPressed: ()=>(), child: Text("Sitio Web"))
            ],
          ),
        ),
        

          ListTile(
            title: Text("Pantalla 1",),
            onTap: () => 
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Pantalla1())),
          ),
          ListTile(
            title: Text("Pantalla 2"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Pantalla2())),
          ),
          ListTile(
            title: Text("Pantalla 3"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Pantalla3())),
          ),

          ListTile(
            title: Row(
              children: [
                Icon(Icons.home_filled),
                Container(width: 10,),
                Text("home"),
              ],
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Ejercicios02App())),
          )

        ],),
      );
  }
}