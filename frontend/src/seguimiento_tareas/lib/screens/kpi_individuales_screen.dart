// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:seguimiento_tareas/controllers/controllerUsuario.dart';
import 'package:seguimiento_tareas/mi_scaffold.dart';

class IndividualesScreen extends StatelessWidget {
  ControllerUsuario userController = ControllerUsuario();

  IndividualesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MiScaffold(
      title: 'KPIs Individuales',
      userController: userController,
      body: const Center(
        child: Text('Aquí van tus KPIs individuales'),
      ),
    );
  }
}
