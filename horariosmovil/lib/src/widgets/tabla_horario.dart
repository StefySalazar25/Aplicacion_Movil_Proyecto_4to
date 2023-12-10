import 'package:flutter/material.dart';

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
   String _selectedDocente = "Luis Chipuxi";
  String _selectedAsignatura = 'Aplicaciones Moviles';
  String _selectedCurso = 'Laboratorio 1';
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Acción que se ejecutará al hacer clic en el botón
        print('Botón $number presionado.');
        // Puedes realizar la acción que necesites aquí

        showDialog(
          context: context,
          builder: (BuildContext context) {
            String data1 = '';
            String data2 = '';
            String data3 = '';

            return AlertDialog(
              title: Text('Ingresar datos'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   DropdownButtonFormField<String>(
                value: _selectedDocente,
                onChanged: (newValue) {
                  setState(() {
                    _selectedDocente = newValue!;
                    _DcenteController.text = newValue;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'Activo',
                    child: Text('Activo'),
                  ),
                  DropdownMenuItem(
                    value: 'Inactivo',
                    child: Text('Inactivo'),
                  ),
                ],
                decoration: InputDecoration(
                  labelText: 'Estado',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, selecciona una opción';
                  }
                  return null;
                },
              ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text('Aceptar'),
                  onPressed: () {
                    // Realiza la acción con los datos ingresados
                    print('Dato 1: $data1');
                    print('Dato 2: $data2');
                    print('Dato 3: $data3');

                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        color: Colors.white, // Puedes cambiar el color según tus necesidades
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add, // Icono de agregar
                color: Colors
                    .blue, // Puedes cambiar el color del icono según tus necesidades
                size:
                    24, // Puedes ajustar el tamaño del icono según tus necesidades
              ),
              SizedBox(height: 8), // Espacio vertical entre el icono y el texto
              Text(
                'Agregar',
                style: TextStyle(
                  color: Colors
                      .blue, // Puedes cambiar el color del texto según tus necesidades
                  fontSize:
                      16, // Puedes ajustar el tamaño del texto según tus necesidades
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
