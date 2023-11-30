import 'package:flutter/material.dart';
import 'package:horariosmovil/src/pages/inicio.dart';
import 'package:horariosmovil/src/widgets/menu_lateral.dart';
import 'package:horariosmovil/src/widgets/reset_password.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  static void navigateToMenuLateral(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InicioPages()),
    );
  }

  static void navigateToResetPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResetPassword()),
    );
  }

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      // Aquí puedes implementar la lógica para verificar las credenciales de inicio de sesión
      // y realizar cualquier acción necesaria, como redireccionar a otra pantalla.
      print('Correo electrónico: $_email');
      print('Contraseña: $_password');
      HomePages.navigateToMenuLateral(
          context); // Redirige a la pantalla MenuLateral
    }
  }

  void _resetPassword() {
    HomePages.navigateToResetPassword(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color.fromARGB(255, 241, 240, 239),
                Color.fromARGB(255, 255, 255, 255)
              ],
              begin: Alignment.topCenter,
            ),
            image: DecorationImage(
              image: AssetImage(
                  'images/logo_yavirac.png'), // Reemplaza con la ruta de tu imagen
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 50.0,
            ),
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text("Horarios"),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa tu correo electrónico';
                        }
                        if (!value.contains('@')) {
                          return 'Correo electrónico no válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingresa tu contraseña';
                        }
                        if (value.length < 6) {
                          return 'La contraseña debe tener al menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: _login,
                      child: Text('Iniciar sesión'),
                    ),
                    const SizedBox(height: 16.0),
                    TextButton(
                      onPressed: _resetPassword,
                      child: const Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
