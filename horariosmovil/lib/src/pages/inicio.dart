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
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: Text(
          "Sistema de Gestión de Horarios ITS YAVIRAC",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 236, 116, 61),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.0), // Espacio vertical antes del título
                  Text(
                    "BIENVENIDOS AL MÓDULO DE GESTIÓN DE HORARIOS DEL ITS YAVIRAC",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0), // Espacio vertical después del título
                  Text(
                    "Bienvenido/as",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.0), // Espacio vertical después del texto
                  Image.asset(
                    'images/horario.jpeg', // Reemplaza con la ruta de tu imagen
                    height: 600.0, // Ajusta la altura según tus necesidades
                    width: 600.0, // Ajusta el ancho según tus necesidades
                  ),
                  // Otros widgets que deseas mostrar en la página de inicio
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}