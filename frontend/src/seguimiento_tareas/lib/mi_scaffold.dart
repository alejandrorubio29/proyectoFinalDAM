import 'package:flutter/material.dart';
import 'package:seguimiento_tareas/controllers/controllerUsuario.dart';
import 'package:seguimiento_tareas/screens/kpi_colectivos_screen.dart';
import 'package:seguimiento_tareas/screens/kpi_individuales_screen.dart';
import 'package:seguimiento_tareas/screens/kpi_seguimiento_screen.dart';
import 'package:seguimiento_tareas/screens/tarea_screen.dart';
import 'package:seguimiento_tareas/screens/configuracion_screen.dart';

class MiScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? appBarLeading;
  final ControllerUsuario
      userController; // Controlar pantallas que se le muestran segun el usuario

  MiScaffold(
      {required this.body,
      required this.title,
      this.appBarLeading,
      required this.userController});

  @override
  Widget build(BuildContext context) {
    String? role = userController.getRole();
    String? username = userController.getUsername();
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              appBarLeading ??
                  Container(), // Si appBarLeading es null, muestra un contenedor vacío
              Text(title), //Titulo página
              Text(username ?? 'Laura'), // Muestra el nombre del usuario
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
                  if (role == 'coordinadorArea')
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
                  if (role == 'areaCoordinator' ||
                      role ==
                          'coordinadorProyecto') // Selecciono que pantalla se le mostrará según el rol del usuario
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
        body: body);
  }
}
