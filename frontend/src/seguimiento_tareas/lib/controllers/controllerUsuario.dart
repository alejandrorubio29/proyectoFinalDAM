// ignore_for_file: avoid_print, unused_local_variable

import 'dart:convert';

import 'package:seguimiento_tareas/models/usuario.dart';
import 'package:http/http.dart' as http;

class ControllerUsuario {
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
      
      usuarioActual = Usuario(nombre: username, rol: 'normal'); 
      return true;
    } else {
      return false;
    }*/

    /////// Prueba manual usuarios ///////

    usuarioActual = Usuario(nombre: 'Laura', rol: 'coordinadorArea');

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

// Obtención de proyectos asignados al usuario
  Future<void> fetchUserProjects(int userId) async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://backend/projects?userId=$userId'), // Endpoint para obtener proyectos asignados al usuario
      );

      if (response.statusCode == 200) {
        final List<dynamic> projectsData = jsonDecode(response.body);
        var proyectos = projectsData.map((project) => project['name']).toList();
      } else {
        print('Error al obtener proyectos del usuario');
      }
    } catch (e) {
      print('Error al obtener proyectos del usuario: $e');
    }
  }
}
