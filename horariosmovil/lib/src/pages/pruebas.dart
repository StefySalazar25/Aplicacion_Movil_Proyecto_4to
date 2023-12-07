import 'package:flutter/material.dart';
import 'package:horariosmovil/src/widgets/lista.dart';

class PruebasPages extends StatefulWidget {
  @override
  _PruebasPagesState createState() => _PruebasPagesState();
}

class _PruebasPagesState extends State<PruebasPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo de Paginación'),
      ),
      body: SafeArea(
        child: ListView(
          children: const <Widget>[
            
          ],
        ),
      ),
    );
  }
}
