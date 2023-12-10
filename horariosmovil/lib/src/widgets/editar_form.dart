import 'package:flutter/material.dart';
import 'package:horariosmovil/src/models/teacher.dart';

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _idFacultadController = TextEditingController();
  TextEditingController _idEstadoController = TextEditingController();
  TextEditingController _contactoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String _selectedFacultad = "Administracion";
  String _selectedEstado = 'Activo';

  @override
  void dispose() {
    _idFacultadController.dispose();
    _idEstadoController.dispose();
    _contactoController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _selectedFacultad,
                onChanged: (newValue) {
                  setState(() {
                    _selectedFacultad = newValue!;
                    _idFacultadController.text = newValue;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: "Administracion",
                    child: Text("Administracion"),
                  ),
                  DropdownMenuItem(
                    value: "Ciencias Exactas",
                    child: Text("Ciencias Exactas"),
                  ),
                  DropdownMenuItem(
                    value: "Sistemas",
                    child: Text("Sistemas"),
                  ),
                  DropdownMenuItem(
                    value: "Comunicacion Social",
                    child: Text("Comunicacion Social"),
                  ),
                  DropdownMenuItem(
                    value: "Dpto estudiantil",
                    child: Text("Dpto estudiantil"),
                  ),
                  DropdownMenuItem(
                    value: "Rectorado",
                    child: Text("Rectorado"),
                  ),
                ],
                decoration: InputDecoration(
                  labelText: 'Facultad',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, selecciona una opción';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedEstado,
                onChanged: (newValue) {
                  setState(() {
                    _selectedEstado = newValue!;
                    _idEstadoController.text = newValue;
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
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactoController,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa un teléfono';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Lógica para guardar los cambios
                    String facultad = _idFacultadController.text;
                    String estado = _idEstadoController.text;
                    String email = _emailController.text;
                    String contacto = _contactoController.text;

                    // Aquí puedes realizar la lógica para guardar los cambios en la base de datos o en la estructura de datos correspondiente

                    // Mostrar el mensaje de éxito
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                          SnackBar(
                            content: Text('Guardados Exitosamente'),
                          ),
                        )
                        .closed
                        .then((_) {
                      // Volver a la página anterior
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text('Guardar cambios'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarOpciones(BuildContext context, DerivedTeacher selectedItem) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EditForm();
      },
    );
  }
}
