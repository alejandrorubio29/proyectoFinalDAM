import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:seguimiento_tareas/models/tarea.dart';

class TareaService {
  final String baseUrl = 'http://127.0.0.1:9877'; // URL, modificar si cambia

  Future<List<Tarea>> fetchTareasPorFecha(DateTime fecha) async {
// Formatea la fecha a una cadena de texto en el formato 'yyyy-MM-dd'
    final String fechaFormatada = DateFormat('yyyy-MM-dd').format(fecha);
    final response = await http
        .get(Uri.parse('$baseUrl/tareas?idUsuario=2&fecha=$fechaFormatada'));

    // Imprime la respuesta del servidor en la consola
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Tarea> tareas =
          body.map((dynamic item) => Tarea.fromJson(item)).toList();
      return tareas;
    } else {
      throw Exception('No se han podido cargar las tareas');
    }
  }

  // Crear tarea nueva
  Future<void> crearTarea(Tarea tarea) async {
    final response = await http.post(
      Uri.parse('$baseUrl/tareas'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(tarea.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('No se ha podido crear la tarea');
    }
  }
}
