import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _newpasswordController = TextEditingController();
  final _repeatpasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _newpasswordController.dispose();
    _repeatpasswordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese un correo electrónico';
    }

    // Validar el formato del correo electrónico utilizando una expresión regular
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese una contraseña';
    }

    // Validar la fortaleza de la contraseña
    final passwordRegex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'La contraseña debe contener al menos una letra mayúscula, una letra minúscula, un dígito y un carácter especial. Además, debe tener al menos 8 caracteres de longitud.';
    }

    return null;
  }

  String? _validateRepeatPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, repita la contraseña';
    }

    final password = _newpasswordController.text;
    if (value != password) {
      return 'Las contraseñas no coinciden';
    }

    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Las validaciones son exitosas, realizar acciones adicionales aquí
      // Por ejemplo, enviar los datos a un servidor
      final email = _emailController.text;
      final newpassword = _newpasswordController.text;
      final repeatpassword = _repeatpasswordController.text;

      // Restablecer los campos del formulario
      _formKey.currentState!.reset();

      // Alerta
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Correo electrónico: $email'),
              Text('Nueva Contraseña: $newpassword'),
              Text('Repita la Contraseña: $repeatpassword'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cerrar'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reestablecer la Contraseña'),
      ),
      body: Container(
        color: Color.fromARGB(255, 250, 250, 250),
        padding: EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: _validateEmail,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _newpasswordController,
                    decoration: InputDecoration(
                      labelText: 'Nueva Contraseña',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    //obscureText=true,
                    validator: _validatePassword,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _repeatpasswordController,
                    decoration: InputDecoration(
                      labelText: 'Repita la Contraseña',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: _validateRepeatPassword,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Guardar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
