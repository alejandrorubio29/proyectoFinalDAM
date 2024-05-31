import 'package:flutter/material.dart';

class Tarea {
  String? proyectoDescripcion;
  String? tangibleDescripcion;
  bool tareaNoPrevista = false;
  String nombreTarea = '';
  bool reunionEvento = false;
  bool completada = false;
  double planificadas = 0;
  double dedicadas = 0;
  //int desviacion = 0;

  // Controladores de texto para los campos Planificadas y Dedicadas -> los pongo aqui para poder instanciarlos para cada tarea
  final planificadasController = TextEditingController();
  final dedicadasController = TextEditingController();
  final nombreTareaController = TextEditingController();

  // Constructor
  Tarea({
    this.proyectoDescripcion,
    this.tangibleDescripcion,
    this.tareaNoPrevista = false,
    this.nombreTarea = '',
    this.reunionEvento = false,
    this.completada = false,
    this.planificadas = 0,
    this.dedicadas = 0,
  }) {
    nombreTareaController.text =
        nombreTarea; // Inicializa el controlador con el valor de nombreTarea
  }

  // Constructor para crear una Tarea desde un JSON
  factory Tarea.fromJson(Map<String, dynamic> json) {
    return Tarea(
      proyectoDescripcion: json['proyectoDescripcion'],
      tangibleDescripcion: json['tangibleDescripcion'],
      tareaNoPrevista: json['tareaNoPrevista'] ?? false,
      nombreTarea: json['descripcion'],
      reunionEvento: json['reunion'] ?? false,
      completada: json['completada'] ?? false,
      planificadas: json['horasPrevistas'],
      dedicadas: json['horasEjecutadas'] ?? 0,
    );
  }

  // Método para convertir una Tarea en JSON
  Map<String, dynamic> toJson() {
    return {
      'proyectoDescripcion': proyectoDescripcion,
      'tangibleDescripcion': tangibleDescripcion,
      'tareaNoPrevista': tareaNoPrevista,
      'descripcion': nombreTarea,
      'reunion': reunionEvento,
      'completada': completada,
      'horasPrevistas': planificadas,
      'horasEjecutadas': dedicadas,
    };
  }

  // Getter para ser instanciado para calcular la desviación
  int get desviacion {
    int planificadas = int.tryParse(planificadasController.text) ?? 0;
    int dedicadas = int.tryParse(dedicadasController.text) ?? 0;
    return dedicadas - planificadas;
  }
}
