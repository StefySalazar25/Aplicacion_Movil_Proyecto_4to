import 'package:flutter/material.dart';
import 'package:horariosmovil/src/widgets/tabla_horario.dart';

class ModificarPages extends StatefulWidget {
  @override
  _ModificarPagesState createState() => _ModificarPagesState();
}

class _ModificarPagesState extends State<ModificarPages> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _JornadaController = TextEditingController();
  TextEditingController _CarreraController = TextEditingController();
  TextEditingController _NivelController = TextEditingController();
  String _selectedJornada = "Matutina";
  String _selectedCarrera = 'Marketing';
  String _selectedNivel = 'Primero';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modificar Horarios'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _selectedJornada,
                onChanged: (newValue) {
                  setState(() {
                    _selectedJornada = newValue!;
                    _JornadaController.text = newValue;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'Matutina',
                    child: Text('Matutina'),
                  ),
                  DropdownMenuItem(
                    value: 'Vespertina',
                    child: Text('Vespertina'),
                  ),
                  DropdownMenuItem(
                    value: 'Nocturna',
                    child: Text('Nocturna'),
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
              DropdownButtonFormField<String>(
                value: _selectedCarrera,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCarrera = newValue!;
                    _CarreraController.text = newValue;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'Marketing',
                    child: Text('Marketing'),
                  ),
                  DropdownMenuItem(
                    value: 'Arte Culinario',
                    child: Text('Arte Culinario'),
                  ),
                  DropdownMenuItem(
                    value: 'Desarrollo de Software',
                    child: Text('Desarrollo de Software'),
                  ),
                  DropdownMenuItem(
                    value: 'Diseño de Modas',
                    child: Text('Diseño de Modas'),
                  ),
                ],
                decoration: InputDecoration(
                  labelText: 'Carreras',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, selecciona una opción';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedNivel,
                onChanged: (newValue) {
                  setState(() {
                    _selectedNivel = newValue!;
                    _NivelController.text = newValue;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'Primero',
                    child: Text('Primero'),
                  ),
                  DropdownMenuItem(
                    value: 'Segundo',
                    child: Text('Segundo'),
                  ),
                  DropdownMenuItem(
                    value: 'Tercero',
                    child: Text('Tercero'),
                  ),
                  DropdownMenuItem(
                    value: 'Cuarto',
                    child: Text('Cuarto'),
                  ),
                  DropdownMenuItem(
                    value: 'Quinto',
                    child: Text('Quinto'),
                  ),
                ],
                decoration: InputDecoration(
                  labelText: 'Nivel',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, selecciona una opción';
                  }
                  return null;
                },
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child: MyGridView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
