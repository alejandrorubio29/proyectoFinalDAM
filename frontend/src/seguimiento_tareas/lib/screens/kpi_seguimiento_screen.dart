import 'package:flutter/material.dart';
import 'package:seguimiento_tareas/mi_scaffold.dart';

class SeguimientoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MiScaffold(
      title: 'KPIs seguimiento',
      body: Center(
        child: Text('Aquí van tus KPIs de seguimiento'),
      ),
    );
  }
}
