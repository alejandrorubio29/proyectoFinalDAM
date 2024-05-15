import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seguimiento_tareas/controllers/controllerTarea.dart';
import 'package:seguimiento_tareas/controllers/controllerUsuario.dart';
import 'package:seguimiento_tareas/mi_scaffold.dart';
import 'package:seguimiento_tareas/models/tarea.dart';

class TareaScreen extends StatefulWidget {
  @override
  _TareaScreenState createState() => _TareaScreenState();
}

// Registro de tareas

class TareaRegistre extends StatefulWidget {
  //Inicializamos controladorde tarea
  final TareaController controller;

  TareaRegistre({required this.controller});

  @override
  _TareaRegistreState createState() => _TareaRegistreState();
}

class _TareaRegistreState extends State<TareaRegistre> {
  // Añadidos listener para actualizar valores de planificadas y dedicadas
  @override
  void initState() {
    super.initState();
    for (var tarea in widget.controller.tareas) {
      tarea.planificadasController.addListener(() => setState(() {}));
      tarea.dedicadasController.addListener(() => setState(() {}));
    }
  }

  // Método que crea las filas, por defecto se crean i filas
  TableRow _crearFila(Tarea tarea) {
    return TableRow(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // Cajetín de texto editable 1: Proyecto. Lista desplegable
              width: 20,
              height: 30,
              child: DropdownButton<String>(
                  value: tarea.proyecto,
                  items:
                      <String>['Proyecto 1', 'Proyecto 2', 'Proyecto 3'] // TODO
                          .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      tarea.proyecto = newValue;
                    });
                  }),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // Cajetín de texto editable 2: Tangible
              width: 20,
              height: 30,
              child: DropdownButton<String>(
                  value: tarea.tangible,
                  items:
                      <String>['Tangible 1', 'Tangible 2', 'Tangible 3'] // TODO
                          .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      tarea.tangible = newValue;
                    });
                  }),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              // Cajetín de texto editable 3: Tarea no prevista. Checkbox
              width: 5,
              height: 30,
              child: Checkbox(
                value: tarea.tareaNoPrevista,
                onChanged: (bool? newValue) {
                  setState(() {
                    tarea.tareaNoPrevista =
                        newValue!; // Actualiza la variable de estado aquí
                  });
                },
              )),
        ),
        FractionallySizedBox(
            widthFactor: 1.7, // Valor que ocupa el cajetin
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  // Cajetín de texto editable 4: Tarea
                  width: 80,
                  height: 30,
                  child: Center(
                      // Centra el TextField verticalmente
                      child: TextField(
                    style: TextStyle(fontSize: 12.0), // Tamaño de la fuente
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: widget.controller
                            .getColor(tarea), // Establece el color de fondo
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromRGBO(199, 148, 13, 1.0)),
                            borderRadius: BorderRadius.circular(5))),
                  ))),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              // Cajetín de texto editable 5: ¿Reunión/evento?
              width: 5,
              height: 30,
              child: Checkbox(
                value: tarea.reunionEvento,
                onChanged: (bool? newValue) {
                  setState(() {
                    tarea.reunionEvento =
                        newValue!; // Actualiza la variable de estado aquí
                  });
                },
              )),
        ),

        // Campo Completada
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              // Cajetín de checkbox 5.1: Completada
              width: 5,
              height: 30,
              child: Checkbox(
                value: tarea.completada,
                onChanged: (bool? newValue) {
                  setState(() {
                    tarea.completada = newValue!;
                  });
                },
              )),
        ),
        FractionallySizedBox(
          widthFactor: 0.5, // Valor que ocupa el cajetin
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  // Cajetín de texto editable 6: Planificadas
                  width: 5,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(199, 148, 13, 1.0)),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                      controller: tarea.planificadasController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: <TextInputFormatter>[
                        widget.controller.planificadasFormatter
                      ]))), // Solo acepta numeros
        ),
        FractionallySizedBox(
          widthFactor: 0.5, // Valor que ocupa el cajetin
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  // Cajetín de texto editable 7: Dedicadas
                  width: 5,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(199, 148, 13, 1.0)),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                      controller: tarea.dedicadasController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: <TextInputFormatter>[
                        widget.controller.dedicadasFormatter
                      ]))), // solo numeros
        ),
        FractionallySizedBox(
            widthFactor: 0.5, // Valor que ocupa el cajetin
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  // Cajetín de texto editable 8: Desviación
                  width: 5,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(199, 148, 13, 1.0)),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    '${tarea.desviacion}',
                    textAlign: TextAlign.center,
                  )), // solo numeros
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
          // Encabezados de la tabla
          Table(
            border:
                const TableBorder(bottom: BorderSide()), // Línea de separación

            children: [
              const TableRow(
                children: [
                  Center(child: Text('Proyecto')),
                  Center(child: Text('Tangible')),
                  Center(child: Text('Tarea no prevista')),
                  Center(child: Text('Tarea')),
                  Center(child: Text('¿Reunión/evento?')),
                  Center(child: Text('Completada')),
                  Center(child: Text('Planificadas')),
                  Center(child: Text('Dedicadas')),
                  Center(child: Text('Desviación')),
                ],
              ),
              TableRow(children: [
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
                Center(
                    child: Text(
                        'Total Planificadas: ${widget.controller.totalPlanificadas}')),
                Center(
                    child: Text(
                        'Total Dedicadas: ${widget.controller.totalDedicadas}')),
                Container(),
              ])
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.controller.tareas.length,
            itemBuilder: (context, index) {
              return Table(
                children: [_crearFila(widget.controller.tareas[index])],
              );
            },
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              //TODO
            },
            child: const Icon(Icons.save),
            backgroundColor: Colors.green),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100, // Ajusta el ancho del cajetín aquí
                  child: TextField(
                    keyboardType: TextInputType
                        .number, // Solo permite la entrada de números
                    decoration: InputDecoration(
                      labelText: 'Capacidad diaria',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  // Limpieza de controladores
  @override
  void dispose() {
    for (var tarea in widget.controller.tareas) {
      tarea.planificadasController.dispose();
      tarea.dedicadasController.dispose();
    }
    super.dispose();
  }
}

// Clase principal

class _TareaScreenState extends State<TareaScreen> {
  DateTime selectedDate = DateTime.now();

  TareaController tareaController = TareaController();
  controllerUsuario userController = controllerUsuario();

  late TareaRegistre tareaRegistre;

  @override
  void initState() {
    super.initState();
    tareaRegistre = TareaRegistre(controller: tareaController);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Filas

  @override
  Widget build(BuildContext context) {
    return MiScaffold(
      title: 'Tareas',
      userController: userController,
      appBarLeading: IconButton(
        icon: const Icon(Icons.calendar_today),
        onPressed: () => _selectDate(context),
      ),
      body: Padding(padding: const EdgeInsets.all(8.0), child: tareaRegistre),
    );
  }
}
