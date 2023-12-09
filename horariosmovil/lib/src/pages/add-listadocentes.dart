import 'package:flutter/material.dart';
import 'package:horariosmovil/src/models/teacher.dart';
import 'package:horariosmovil/src/widgets/lista.dart';
import 'package:horariosmovil/src/widgets/teacher_form.dart';

class ListaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Teacher> teacherList = [];

    // Crear objetos de la clase Teacher y agregarlos a la lista
    Teacher teacher1 = Teacher(
      idDocente: '1',
      nombresDocente: 'Juan',
      apellidosDocente: 'Pérez',
      contactoDocente: '123456789',
      emailDocente: 'juan@example.com',
      contraseniaDocente: 'password123',
      idRama: '',
      idFacultad: '',
      idEstado: 1,
      idRol: 1,
    );
    teacherList.add(teacher1);

    Teacher teacher2 = Teacher(
      idDocente: '2',
      nombresDocente: 'María',
      apellidosDocente: 'González',
      contactoDocente: '987654321',
      emailDocente: 'maria@example.com',
      contraseniaDocente: 'password456',
      idRama: '',
      idFacultad: '',
      idEstado: 1,
      idRol: 2,
    );
    teacherList.add(teacher2);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista Docentes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 236, 116, 61),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherForm()),
              );
            },
            child: Text('Agregar Docente'),
          ),
          Expanded(
            child: ListaWidget(items: teacherList),
          ),
        ],
      ),
    );
  }
}
