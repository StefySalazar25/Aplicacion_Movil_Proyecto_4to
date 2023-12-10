class Teacher {
  final String idDocente;
  final String nombresDocente;
  final String apellidosDocente;
  final String contactoDocente;
  final String emailDocente;
  final String contraseniaDocente;
  final String idRama;
  final String idFacultad;
  final int idEstado;
  final int idRol;

  Teacher({
    required this.idDocente,
    required this.nombresDocente,
    required this.apellidosDocente,
    required this.contactoDocente,
    required this.emailDocente,
    required this.contraseniaDocente,
    required this.idRama,
    required this.idFacultad,
    required this.idEstado,
    required this.idRol,
  });

}
class DerivedTeacher extends Teacher {
  DerivedTeacher({
    required String contactoDocente,
    required String emailDocente,
    required String idFacultad,
    required int idEstado,
  }) : super(
          idDocente: '',
          nombresDocente: '',
          apellidosDocente: '',
          contactoDocente: contactoDocente,
          emailDocente: emailDocente,
          contraseniaDocente: '',
          idRama: '',
          idFacultad: idFacultad,
          idEstado: idEstado,
          idRol: 0,
        );
}
