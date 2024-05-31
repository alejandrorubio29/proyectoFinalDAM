// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:seguimiento_tareas/controllers/controllerUsuario.dart';
import 'package:seguimiento_tareas/mi_scaffold.dart';

class ConfiguracionScreen extends StatelessWidget {
  ControllerUsuario userController = ControllerUsuario();

  @override
  Widget build(BuildContext context) {
    return MiScaffold(
      title: 'Configuracion',
      userController: userController,
      body: Center(
        child: Text('Aquí van tu configuracion'),
      ),
    );
  }
}
