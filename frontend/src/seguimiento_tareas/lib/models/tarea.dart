import 'package:flutter/material.dart';

class Tarea {
  String? proyecto;
  String? tangible;
  bool tareaNoPrevista = false;
  String nombreTarea = '';
  bool reunionEvento = false;
  bool completada = false;
  int planificadas = 0;
  int dedicadas = 0;
  //int desviacion = 0;

  // Controladores de texto para los campos Planificadas y Dedicadas -> los pongo aqui para poder instanciarlos para cada tarea
  final planificadasController = TextEditingController();
  final dedicadasController = TextEditingController();

  // Getter para ser instanciado para calcular la desviación
  int get desviacion {
    int planificadas = int.tryParse(planificadasController.text) ?? 0;
    int dedicadas = int.tryParse(dedicadasController.text) ?? 0;
    return dedicadas - planificadas;
  }
}
