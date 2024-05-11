import 'package:flutter/material.dart';
import 'package:seguimiento_tareas/screens/kpi_colectivos_screen.dart';
import 'package:seguimiento_tareas/screens/kpi_individuales_screen.dart';
import 'package:seguimiento_tareas/screens/kpi_seguimiento_screen.dart';
import 'package:seguimiento_tareas/screens/tarea_screen.dart';
import 'package:seguimiento_tareas/screens/configuracion_screen.dart';

class MiScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? appBarLeading;

  MiScaffold({required this.body, required this.title, this.appBarLeading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            appBarLeading ??
                Container(), // Si appBarLeading es null, muestra un contenedor vacío
            Text(title), //Titulo página
            Text('Juan Perez'), // Nombre del usuario, TODO
            Image.asset('assets/images/logo.jpg',
                height: 70.0), // Logo de la empresa
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Tareas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TareaScreen()),
                );
              },
            ),
            ExpansionTile(
              title: Text('Indicadores'),
              children: <Widget>[
                ListTile(
                  title: Text('Individuales'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IndividualesScreen()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Colectivos'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ColectivosScreen()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Seguimiento'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SeguimientoScreen()),
                    );
                  },
                ),
              ],
            ),
            ListTile(
              title: Text('Configuración'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConfiguracionScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
