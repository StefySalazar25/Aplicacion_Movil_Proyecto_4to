// widgets/lista_widget.dart

import 'package:flutter/material.dart';
import 'package:horariosmovil/src/models/teacher.dart';
import 'package:horariosmovil/src/widgets/editar_form.dart';

// Asegúrate de importar la clase Teacher

class ListaWidget extends StatelessWidget {
  final List<Teacher> items;
  final Function(Teacher) onDeleteItem;

  ListaWidget({required this.items,
  required this.onDeleteItem,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            '${items[index].nombresDocente} ${items[index].apellidosDocente}',
          ),
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
              Divider(),
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                title: Text('Editar'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditForm()),
                  );
                },
              ),
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                title: Text('Eliminar'),
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

  void _eliminarElemento(BuildContext context, Teacher selectedItem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Eliminar elemento'),
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar elemento'),
          content: Text('¿Estás seguro de que deseas eliminar este elemento?'),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text(
                'Eliminar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // Llama a la función de devolución de llamada para eliminar el elemento
                onDeleteItem(selectedItem);

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Elemento eliminado'),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
