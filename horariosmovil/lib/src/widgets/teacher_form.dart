import 'package:flutter/material.dart';
import 'package:horariosmovil/src/models/teacher.dart';

class TeacherForm extends StatefulWidget {
  @override
  _TeacherFormState createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  final _formKey = GlobalKey<FormState>();
  final _cedulaController = TextEditingController();
  final _nombresController = TextEditingController();
  final _apellidosController = TextEditingController();
  final _contactoController = TextEditingController();
  final _emailController = TextEditingController();
  final _ramaController = TextEditingController();
  final _facultadController = TextEditingController();

  @override
  void dispose() {
    _cedulaController.dispose();
    _nombresController.dispose();
    _apellidosController.dispose();
    _contactoController.dispose();
    _emailController.dispose();
    _ramaController.dispose();
    _facultadController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Obtener los valores de los campos
      final cedula = _cedulaController.text;
      final nombres = _nombresController.text;
      final apellidos = _apellidosController.text;
      final contacto = _contactoController.text;
      final email = _emailController.text;
      final rama = _ramaController.text;
      final facultad = _facultadController.text;
      int estado = 0;
      int rol = 0;
      String contra = '';

      // Crear un objeto Teacher con los valores
      final teacher = Teacher(
          idDocente: cedula,
          nombresDocente: nombres,
          apellidosDocente: apellidos,
          contactoDocente: contacto,
          emailDocente: email,
          idRama: rama,
          idFacultad: facultad,
          idEstado: estado,
          idRol: rol,
          contraseniaDocente: contra);

      // Realizar acciones con el objeto Teacher, como guardarlo en una lista o enviarlo a una base de datos
      print('Datos del docente:');
      print('Cédula: ${teacher.idDocente}');
      print('Nombres: ${teacher.nombresDocente}');
      print('Apellidos: ${teacher.apellidosDocente}');
      print('Contacto: ${teacher.contactoDocente}');
      print('Email: ${teacher.emailDocente}');
      print('Rama: ${teacher.idRama}');
      print('Facultad: ${teacher.idFacultad}');

      // Reiniciar los campos del formulario
      _cedulaController.clear();
      _nombresController.clear();
      _apellidosController.clear();
      _contactoController.clear();
      _emailController.clear();
      _ramaController.clear();
      _facultadController.clear();

      // Mostrar un mensaje de éxito o navegar a otra pantalla
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Formulario enviado con éxito')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Docentes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _cedulaController,
                      decoration: InputDecoration(labelText: 'Cédula'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa la cédula del docente';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _nombresController,
                      decoration: InputDecoration(labelText: 'Nombres'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa los nombres del docente';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _apellidosController,
                      decoration: InputDecoration(labelText: 'Apellidos'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa los apellidos del docente';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _contactoController,
                      decoration: InputDecoration(labelText: 'Contacto'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa la información de contacto del docente';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa el email del docente';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _ramaController,
                      decoration: InputDecoration(labelText: 'Rama'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa la rama del docente';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _facultadController,
                      decoration: InputDecoration(labelText: 'Facultad'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa la facultad del docente';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }
}
