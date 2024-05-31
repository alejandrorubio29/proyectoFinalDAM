import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seguimiento_tareas/controllers/controllerTarea.dart';
import 'package:seguimiento_tareas/controllers/controllerUsuario.dart';
import 'package:seguimiento_tareas/mi_scaffold.dart';
import 'package:seguimiento_tareas/models/tarea.dart';

const double paddingValue = 8.0;
const double containerWidth = 20.0;
const double containerHeight = 30.0;
const double borderWidth = 1.0;
const double borderRadiusValue = 5.0;
const Color borderColor = Color.fromRGBO(199, 148, 13, 1.0);

class TareaScreen extends StatefulWidget {
  @override
  _TareaScreenState createState() => _TareaScreenState();
}

class _TareaScreenState extends State<TareaScreen> {
  DateTime selectedDate = DateTime.now();

  TareaController tareaController = TareaController();
  ControllerUsuario userController = ControllerUsuario();

  late TareaRegistre tareaRegistre;

  @override
  void initState() {
    super.initState();
    tareaRegistre = TareaRegistre(
        controller: tareaController,
        actualizarEstadoWidgets: _actualizarEstadoWidgets);
    _cargarTareas(selectedDate);
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
      _cargarTareas(selectedDate);
    }
  }

  Future<void> _cargarTareas(DateTime fecha) async {
    await tareaController.cargarTareas(fecha);
    setState(() {});
  }

  void _actualizarEstadoWidgets() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MiScaffold(
      title: 'Tareas',
      userController: userController,
      appBarLeading: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
          Text(
            '${selectedDate.toLocal()}'.split(' ')[0],
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(paddingValue),
        child: tareaRegistre,
      ),
    );
  }
}

class TareaRegistre extends StatefulWidget {
  final TareaController controller;
  final VoidCallback actualizarEstadoWidgets;

  TareaRegistre(
      {required this.controller, required this.actualizarEstadoWidgets});

  @override
  _TareaRegistreState createState() => _TareaRegistreState();
}

class _TareaRegistreState extends State<TareaRegistre> {
  @override
  void initState() {
    super.initState();
    for (var tarea in widget.controller.tareas) {
      tarea.planificadasController.addListener(() => setState(() {}));
      tarea.dedicadasController.addListener(() => setState(() {}));
    }
  }

  // CREACION WIDGETS //

  TableRow _crearFila(Tarea tarea) {
    return TableRow(
      children: [
        _crearDropdown(tarea.proyectoDescripcion,
            ['Proyecto 1', 'Proyecto 2', 'Proyecto 3'], (newValue) {
          setState(() {
            tarea.proyectoDescripcion = newValue;
          });
        }),
        _crearDropdown(tarea.tangibleDescripcion,
            ['Tangible 1', 'Tangible 2', 'Tangible 3'], (newValue) {
          setState(() {
            tarea.tangibleDescripcion = newValue;
          });
        }),
        _crearCheckbox(tarea.tareaNoPrevista, (newValue) {
          setState(() {
            tarea.tareaNoPrevista = newValue!;
          });
        }),
        _crearTextFieldT(tarea.nombreTareaController, (text) {
          tarea.nombreTarea = text;
        }, tarea),
        _crearCheckbox(tarea.reunionEvento, (newValue) {
          setState(() {
            tarea.reunionEvento = newValue!;
          });
        }),
        _crearCheckbox(tarea.completada, (newValue) {
          setState(() {
            tarea.completada = newValue!;
          });
        }),
        _crearTextFieldN(tarea.planificadasController, (text) {}, null),
        _crearTextFieldN(tarea.dedicadasController, (text) {}, null),
        Padding(
          padding: const EdgeInsets.all(paddingValue),
          child: Text(
            '${tarea.desviacion}',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _crearDropdown(
      String? value, List<String> items, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.all(paddingValue),
      child: DropdownButton<String>(
        value: items.contains(value)
            ? value
            : null, // Asegurar que si el valor no está en la lista, se establezca un valor nulo
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _crearCheckbox(bool? value, ValueChanged<bool?> onChanged) {
    return Padding(
      padding: const EdgeInsets.all(paddingValue),
      child: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
  /*
  Widget _crearTextFieldT(TextEditingController controller,
      ValueChanged<String> onChanged, Tarea? tarea) {
    return Padding(
      padding: const EdgeInsets.all(paddingValue),
      child: Expanded(
        child: Center(
          child: TextField(
            controller: controller,
            style: TextStyle(fontSize: 12.0),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  tarea != null ? widget.controller.getColor(tarea) : null,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(borderRadiusValue),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }*/

  Widget _crearTextFieldT(TextEditingController controller,
      ValueChanged<String> onChanged, Tarea? tarea) {
    return Padding(
      padding: const EdgeInsets.all(paddingValue),
      child: Flexible(
        flex: 2,
        child: Center(
          child: TextField(
            controller: controller,
            style: TextStyle(fontSize: 12.0),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  tarea != null ? widget.controller.getColor(tarea) : null,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(borderRadiusValue),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  /*Widget _crearTextFieldN(TextEditingController controller,
      ValueChanged<String> onChanged, Tarea? tarea) {
    return Padding(
      padding: const EdgeInsets.all(paddingValue),
      child: Flexible(
        child: Center(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(fontSize: 12.0),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  tarea != null ? widget.controller.getColor(tarea) : null,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(borderRadiusValue),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }*/

  Widget _crearTextFieldN(TextEditingController controller,
      ValueChanged<String> onChanged, Tarea? tarea) {
    return Padding(
      padding: const EdgeInsets.all(paddingValue),
      child: Flexible(
        flex: 1, // Ajuste del ancho relativo
        child: Center(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(fontSize: 12.0),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  tarea != null ? widget.controller.getColor(tarea) : null,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(borderRadiusValue),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalPlanificadas = widget.controller.totalPlanificadas;
    final totalDedicadas = widget.controller.totalDedicadas;

    return Scaffold(
        body: ListView(
          children: [
            Table(
              border: const TableBorder(bottom: BorderSide()),
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
                TableRow(
                  children: [
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                    Center(
                        child: Text('Total Planificadas: $totalPlanificadas')),
                    Center(child: Text('Total Dedicadas: $totalDedicadas')),
                    Container(),
                  ],
                ),
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
          ],
        ),
        floatingActionButton: Tooltip(
          message: 'Añadir nueva tarea para hoy',
          child: FloatingActionButton(
            onPressed: () async {
              // Diálogo para registrar nueva tarea.
              final nuevaTarea = await showDialog<Tarea>(
                context: context,
                builder: (context) => _buildAgregarTareaDialog(context),
              );

              // Verificar si el usuario canceló la creación de la tarea
              if (nuevaTarea != null) {
                setState(() {
                  // Agregar la nueva tarea a la lista de tareas
                  widget.controller.tareas.add(nuevaTarea);
                });
              }
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.green,
          ),
        ));
  }

//Metodo creacion nueva tarea
  Dialog _buildAgregarTareaDialog(BuildContext context) {
    // Controladores para los campos de entrada
    TextEditingController proyectoController = TextEditingController();
    TextEditingController tangibleController = TextEditingController();
    TextEditingController nombreTareaController = TextEditingController();

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agregar nueva tarea',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: proyectoController,
              decoration: InputDecoration(labelText: 'Proyecto'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: tangibleController,
              decoration: InputDecoration(labelText: 'Tangible'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nombreTareaController,
              decoration: InputDecoration(labelText: 'Nombre de la tarea'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                        context); // Cerrar el diálogo sin crear la tarea
                  },
                  child: Text('Cancelar'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    // Crear la nueva tarea con los datos ingresados por el usuario
                    final nuevaTarea = Tarea(
                      proyectoDescripcion: proyectoController.text,
                      tangibleDescripcion: tangibleController.text,
                      tareaNoPrevista: false, // Valor por defecto
                      reunionEvento: false, // Valor por defecto
                      completada: false, // Valor por defecto
                      nombreTarea: nombreTareaController.text,
                    );

                    try {
                      // Intentar crear la tarea
                      await widget.controller.crearTarea(nuevaTarea);

                      // Si la tarea se creó correctamente, cerrar el diálogo y devolver la nueva tarea
                      Navigator.pop(context, nuevaTarea);
                    } catch (e) {
                      // Si se produce un error, mostrar un mensaje de error al usuario
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Error al guardar la tarea. Por favor, inténtalo de nuevo.'),
                        ),
                      );
                    }
                  },
                  child: Text('Guardar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var tarea in widget.controller.tareas) {
      tarea.planificadasController.dispose();
      tarea.dedicadasController.dispose();
    }
    super.dispose();
  }
}
