import 'package:seguimiento_tareas/models/usuario.dart';

class controllerUsuario {
  Usuario? usuarioActual;

  // Verificacion credenciales usuario
  Future<bool> verifyPassword(String username, String password) async {
    // Solicitud a backend Springboot
    /*final response = await http.post(
      'http://backend/login' as Uri,
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Aquí deberías obtener el rol del usuario del backend y asignarlo a usuarioActual
      usuarioActual = Usuario(nombre: username, rol: 'normal'); // TODO: reemplazar 'normal' con el rol real
      return true;
    } else {
      return false;
    }*/

    /////// Prueba manual usuarios ///////

    usuarioActual = Usuario(nombre: username, rol: 'areaCoordinator');

    return true; //TODO
  }

  //Obtención del rol de usuario
  String? getRole() {
    return usuarioActual?.rol;
  }

  //Obtención del nombre de usuario

  String? getUsername() {
    return usuarioActual?.nombre;
  }
}
