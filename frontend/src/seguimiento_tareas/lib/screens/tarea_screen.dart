import 'package:flutter/material.dart';
import 'package:seguimiento_tareas/mi_scaffold.dart';

class TareaScreen extends StatefulWidget {
  @override
  _TareaScreenState createState() => _TareaScreenState();
}

// Registro de tareas

class TareaRegistre extends StatefulWidget {
  @override
  _TareaRegistreState createState() => _TareaRegistreState();
}

class _TareaRegistreState extends State<TareaRegistre> {
  List<TableRow> _rows = [];
  int numFilas = 10;

  @override
  void initState() {
    super.initState();
    // Inicializa las filas con el número de filas parametrizado
    _rows = List.filled(numFilas, _crearFila(10));
  }

  // Método que crea las filas
  TableRow _crearFila(int i) {
    return TableRow(
      children: [
        Text('Tarea ${i + 1}'), // Nombre de la tarea
        Container(
            // Cajetín de texto editable
            width: 100,
            height: 30,
            child: TextField(),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _rows.length,
        itemBuilder: (context, index) {
          return Table(
            children: [_rows[index]],
          );
        },
      ),
    );
  }
}

// Clase principal

class _TareaScreenState extends State<TareaScreen> {
  DateTime selectedDate = DateTime.now();
  TareaRegistre tareaRegistre = TareaRegistre();

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
      appBarLeading: IconButton(
        icon: const Icon(Icons.calendar_today),
        onPressed: () => _selectDate(context),
      ),
      body: Padding(padding: const EdgeInsets.all(8.0), child: tareaRegistre),
    );
  }
}
