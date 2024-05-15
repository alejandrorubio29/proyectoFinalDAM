import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seguimiento_tareas/models/tarea.dart';

class TareaController {
  // Generacion listado de tareas

  List<Tarea> _tareas = List.generate(10, (i) => Tarea());

  List<Tarea> get tareas => _tareas;

  void updateTarea(int index, Tarea tarea) {
    _tareas[index] = tarea;
  }

  // Formateadores de entrada para asegurar que solo se ingresen números
  final planificadasFormatter = FilteringTextInputFormatter.digitsOnly;
  final dedicadasFormatter = FilteringTextInputFormatter.digitsOnly;

// Funcion e color según si completada o no
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
