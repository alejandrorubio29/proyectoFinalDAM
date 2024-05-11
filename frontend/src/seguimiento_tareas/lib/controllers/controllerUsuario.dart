import 'package:http/http.dart' as http;
import 'dart:convert';

class controllerUsuario {
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
      return true;
    } else {
      return false;
    }*/
    return true; //TODO
  }
}
