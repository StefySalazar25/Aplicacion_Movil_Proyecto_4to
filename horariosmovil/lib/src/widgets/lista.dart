// widgets/lista_widget.dart

import 'package:flutter/material.dart';
import 'package:horariosmovil/src/models/teacher.dart';
// Asegúrate de importar la clase Teacher

class ListaWidget extends StatelessWidget {
  final List<Teacher> items;

  ListaWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
              '${items[index].nombresDocente} ${items[index].apellidosDocente}'),
          onTap: () {
            _mostrarOpciones(context, items[index]);
          },
        );
      },
    );
  }

  void _mostrarOpciones(BuildContext context, Teacher selectedItem) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('ID: ${selectedItem.idDocente}'),
              ),
              ListTile(
                title: Text('Contacto: ${selectedItem.contactoDocente}'),
              ),
              ListTile(
                title: Text('Email: ${selectedItem.emailDocente}'),
              ),
              Divider(), // Añade un separador
              ListTile(
                leading: Icon(Icons.edit),
                title: Text(
                    'Editar ${selectedItem.nombresDocente} ${selectedItem.apellidosDocente}'),
                onTap: () {
                  Navigator.pop(context);
                  _editarElemento(context, selectedItem);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text(
                    'Eliminar ${selectedItem.nombresDocente} ${selectedItem.apellidosDocente}'),
                onTap: () {
                  Navigator.pop(context);
                  _eliminarElemento(context, selectedItem);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _editarElemento(BuildContext context, Teacher selectedItem) {
    // Lógica para editar el elemento seleccionado
    // Aquí puedes mostrar un formulario de edición con los datos del profesor
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              'Editar ${selectedItem.nombresDocente} ${selectedItem.apellidosDocente}')),
    );
  }

  void _eliminarElemento(BuildContext context, Teacher selectedItem) {
    // Lógica para eliminar el elemento seleccionado
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              'Eliminar ${selectedItem.nombresDocente} ${selectedItem.apellidosDocente}')),
    );
  }
}
