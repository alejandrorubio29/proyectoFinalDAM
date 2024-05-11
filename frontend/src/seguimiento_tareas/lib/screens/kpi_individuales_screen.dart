import 'package:flutter/material.dart';
import 'package:seguimiento_tareas/mi_scaffold.dart';

class IndividualesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MiScaffold(
      title: 'KPIs Individuales',
      body: Center(
        child: Text('Aquí van tus KPIs individuales'),
      ),
    );
  }
}
