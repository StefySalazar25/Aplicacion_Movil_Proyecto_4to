import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistema de Gestión de Horarios ITS YAVIRAC"),
        backgroundColor: Color.fromARGB(255, 84, 100, 243),
      ),
      body: Center(
        child: Center(
          child: Text("Contenido del proyecto"),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("MENU"),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 87, 47, 233)),
              accountEmail: null,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "Home");
              },
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Inicio"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'Docentes');
              },
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Docentes"),
              ),
            ),
            InkWell(
              onTap: () {
                // Acción al hacer clic en el botón
                // Por ejemplo, navegar a otra pantalla
              },
              child: ListTile(
                leading: Icon(Icons.person_add),
                title: Text("Agregar Estudiante"),
              ),
            ),
            InkWell(
              onTap: () {
                // Acción al hacer clic en el botón
                // Por ejemplo, navegar a otra pantalla
              },
              child: ListTile(
                leading: Icon(Icons.schedule),
                title: Text("Modificar Horario"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
