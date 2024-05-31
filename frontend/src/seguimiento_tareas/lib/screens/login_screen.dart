import 'package:flutter/material.dart';
import 'package:seguimiento_tareas/controllers/controllerUsuario.dart';
import 'tarea_screen.dart';

class LoginScreen extends StatelessWidget {
  // Controladores para los campos de texto
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Instancia controlador de usuario
  final _controllerUsuario = ControllerUsuario();

  // Boton "he olvidado mi contraseña"

  Widget passwdOlvidado(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Lógica de olvido de la contraseña. Por ahora TODO
      },
      child: Text('He olvidado mi contraseña'),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Fondo con color corporativo C7940D
    var backgroundColor = Colors.white; //Color.fromRGBO(199, 148, 13, 1.0);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: backgroundColor),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Seguimiento Diario de Tareas',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    color: Color.fromRGBO(
                        199, 148, 13, 1.0)), //Color.fromRGBO(66, 74, 82, 1.0)),
              ),
              const SizedBox(height: 50),
              FractionallySizedBox(
                widthFactor: 0.5,
                child:
                    Image.asset('assets/images/logo.jpg', fit: BoxFit.fitWidth),
              ),
              const SizedBox(height: 20),

              // Usuario

              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person), //Icono personita
                  labelText: 'Usuario',
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock), // Icono de una llave
                  labelText: 'Contraseña',
                ),
                obscureText: true, // Oculta la contraseña
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Verifica las credenciales del usuario
                  bool loginSuccessful =
                      await _controllerUsuario.verifyPassword(
                    _usernameController.text,
                    _passwordController.text,
                  );

                  // Si las credenciales son correctas, navega a la siguiente pantalla
                  if (loginSuccessful) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TareaScreen()),
                    );
                  } else {
                    // Muestra un mensaje de error
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Usuario o contraseña incorrectos')),
                    );
                  }
                },
                child: Text('Entrar'),
              ),
              passwdOlvidado(context), // botón olvido contraseña
            ],
          ),
        ),
      ),
    );
  }
}
