import 'package:flutter/material.dart';
import 'package:horariosmovil/src/widgets/menu_lateral.dart';

class InicioPages extends StatefulWidget {
  const InicioPages({Key? key}) : super(key: key);

  @override
  _InicioPagesState createState() => _InicioPagesState();
}

class _InicioPagesState extends State<InicioPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(), // The MenuLateral widget is added here
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: SafeArea(
        child: ListView(
          children: const <Widget>[
            // Other widgets you want to display on the home page
          ],
        ),
      ),
    );
  }
}