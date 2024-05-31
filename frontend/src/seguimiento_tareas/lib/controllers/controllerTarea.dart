// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seguimiento_tareas/models/tarea.dart';
import 'package:seguimiento_tareas/services/tarea_service.dart';

class TareaController {
  // Inicio servicio

  final TareaService _tareaService = TareaService();

  // Generacion listado de tareas vacío (Por defecto 10)

  List<Tarea> tareas = List.generate(10, (i) => Tarea());

  Future<void> cargarTareas(DateTime fecha) async {
    List<Tarea> tareasCargadas = await _tareaService.fetchTareasPorFecha(fecha);

    // Rellenar la lista tareas con las tareas obtenidas, manteniendo 10 elementos
    for (int i = 0; i < tareas.length; i++) {
      if (i < tareasCargadas.length) {
        tareas[i] = tareasCargadas[i];
      } else {
        tareas[i] = Tarea();
      }
    }
  }

  Future<void> crearTarea(Tarea tarea) async {
    try {
      await _tareaService.crearTarea(tarea);
      // Actualizar la lista de tareas después de crear una nueva tarea
      await cargarTareas(DateTime.now());
    } catch (e) {
      print('Error al crear la tarea: $e');
    }
  }

  void updateTarea(int index, Tarea tarea) {
    tareas[index] = tarea;
  }

  // Formateadores de entrada para asegurar que solo se ingresen números
  final planificadasFormatter = FilteringTextInputFormatter.digitsOnly;
  final dedicadasFormatter = FilteringTextInputFormatter.digitsOnly;

// Funcion de color según si completada o no
  Color getColor(Tarea tarea) {
    return tarea.completada ? Colors.grey : Colors.white;
  }

  // Getter totalPlanificadas
  int get totalPlanificadas {
    return tareas.fold(
        0,
        (total, tarea) =>
            total + (int.tryParse(tarea.planificadasController.text) ?? 0));
  }

  // Getter totalPlanificadas
  int get totalDedicadas {
    return tareas.fold(
        0,
        (total, tarea) =>
            total + (int.tryParse(tarea.dedicadasController.text) ?? 0));
  }
}
