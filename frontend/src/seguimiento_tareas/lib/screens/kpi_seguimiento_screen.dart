import 'package:flutter/material.dart';
import 'package:seguimiento_tareas/controllers/controllerUsuario.dart';
import 'package:seguimiento_tareas/mi_scaffold.dart';

class SeguimientoScreen extends StatelessWidget {
  controllerUsuario userController = controllerUsuario();

  @override
  Widget build(BuildContext context) {
    return MiScaffold(
      title: 'KPIs seguimiento',
      userController: userController,
      body: Center(
        child: Text('Aquí van tus KPIs de seguimiento'),
      ),
    );
  }
}
