import 'package:flutter/material.dart';
import 'package:horariosmovil/src/pages/add-listadocentes.dart';
import 'package:horariosmovil/src/pages/home_pages.dart';
import 'package:horariosmovil/src/pages/inicio.dart';
import 'package:horariosmovil/src/widgets/menu_lateral.dart';
import 'package:horariosmovil/src/widgets/reset_password.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horarios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePages(
          //title: 'Pantalla Deber - Programación Móvil - Santiago Venegas',
          ),
      //Generando las rutas de navegación.
      initialRoute: "Home",
      routes: <String, WidgetBuilder>{
        "Home": (BuildContext) => HomePages(),
        "MenuLateral": (BuildContext) => MenuLateral(),
        "ResetPassword": (BuildContext) => ResetPassword(),
        "Docentes": (BuildContext) => ListaPage(),
        "Inicio": (BuildContext) => InicioPages(),
      },
    );
  }
}
