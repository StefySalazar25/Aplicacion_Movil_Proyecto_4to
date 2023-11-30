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
      body: ListView(
        children: <Widget>[
          MenuLateral(),
          // Otros widgets que quieras mostrar en la página de inicio
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
