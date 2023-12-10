import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cuadrícula de Botones'),
        ),
        body: MyGridView(),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 8.0, // Espacio horizontal entre elementos
        mainAxisSpacing: 8.0, // Espacio vertical entre elementos
      ),
      itemCount: 6 * 5, // 6 columnas x 5 filas
      itemBuilder: (BuildContext context, int index) {
        return MyGridItem(index + 1); // index + 1 porque index comienza en 0
      },
    );
  }
}

class MyGridItem extends StatelessWidget {
  final int number;

  MyGridItem(this.number);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Acción que se ejecutará al hacer clic en el botón
        print('Botón $number presionado.');
        // Puedes realizar la acción que necesites aquí
      },
      child: Container(
        color: Colors.blue, // Puedes cambiar el color según tus necesidades
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
