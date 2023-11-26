import 'package:flutter/material.dart';
import 'package:horariosmovil/src/pages/home_pages.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePages(
        //title: 'Pantalla Deber - Programación Móvil - Santiago Venegas',
      ),
    );
  }
}