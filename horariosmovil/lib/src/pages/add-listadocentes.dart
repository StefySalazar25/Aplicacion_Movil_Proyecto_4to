import 'package:flutter/material.dart';
import 'package:horariosmovil/src/models/teacher.dart';
import 'package:horariosmovil/src/widgets/lista.dart';
import 'package:horariosmovil/src/widgets/teacher_form.dart';

class ListaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Teacher> teacherList = [];
    void onDeleteItem(Teacher item) {
    setState(() {
      items.remove(item);
    });
  }

    // Crear objetos de la clase Teacher y agregarlos a la lista
    Teacher teacher1 = Teacher(
      idDocente: '1',
      nombresDocente: 'Lorena',
      apellidosDocente: 'Chulce',
      contactoDocente: '123456789',
      emailDocente: 'chuldel@yavirac.edu.ec',
      contraseniaDocente: 'password123',
      idRama: '',
      idFacultad: '',
      idEstado: 1,
      idRol: 1,
    );
    teacherList.add(teacher1);

    Teacher teacher2 = Teacher(
      idDocente: '2',
      nombresDocente: 'Luis',
      apellidosDocente: 'Chipuxi',
      contactoDocente: '987654321',
      emailDocente: 'chipuxil@yavirac.edu.ec',
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
          Expanded(
            child: ListaWidget(items: teacherList),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeacherForm()),
                );
              },
              child: Text(
                'Agregar Docente',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    color: Color.fromARGB(255, 207, 107, 61),
                    width: 2.0,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 236, 116, 61),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
