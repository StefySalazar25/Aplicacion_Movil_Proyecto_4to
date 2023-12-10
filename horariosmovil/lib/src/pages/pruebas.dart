import 'package:flutter/material.dart';

class PruebasPages extends StatefulWidget {
  @override
  _PruebasPagesState createState() => _PruebasPagesState();
}

class _PruebasPagesState extends State<PruebasPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de Paginación'),
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
