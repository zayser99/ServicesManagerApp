import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/cliente_model.dart';
import 'package:services_manager_app/providers/citas_provider.dart';
import 'package:services_manager_app/providers/clientes_provider.dart';

class AgregarCita extends StatefulWidget {
  const AgregarCita({Key? key}) : super(key: key);

  @override
  State<AgregarCita> createState() => _AgregarCitaState();
}

class _AgregarCitaState extends State<AgregarCita> {
  int dropdownValue = 1;

  String _fecha = '';
  String _hora = '';
  String _comentario = '';

  // ignore: prefer_final_fields
  TextEditingController _imputDateController = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _imputTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final clientesProvider = Provider.of<ClientesProvider>(context);
    clientesProvider.cargarClientes();
    final List<ClienteModel> clientes = clientesProvider.clientes;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Agregar Cita'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'agregar Cita',
            onPressed: () {
              final citasProvider = CitasProvider();
              citasProvider.nuevaCita(
                0,
                _fecha,
                _hora,
                _comentario,
                dropdownValue,
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _inputFecha(),
          const Divider(height: 60),
          _inputHora(),
          const Divider(height: 60),
          _inputCom(),
          const Divider(height: 60),
          _inputTipo(clientes),
        ],
      ),
    );
  }

  Widget _inputFecha() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _imputDateController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Fecha de la cita',
        labelText: 'Fecha',
        icon: const Icon(Icons.date_range),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  Widget _inputHora() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _imputTimeController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Hora de la cita',
        labelText: 'Hora',
        icon: const Icon(Icons.timer),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectTime(context);
      },
    );
  }

  Widget _inputCom() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Comentario de la cita',
        labelText: 'Comentario',
        icon: const Icon(Icons.list),
      ),
      onChanged: (valor) {
        _comentario = valor;
      },
    );
  }

  Widget _inputTipo(List<ClienteModel> clientes) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(Icons.build_circle_outlined, color: Colors.grey),
        ),
        DropdownButton(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          onChanged: (int? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: clientes.map((list) {
            return DropdownMenuItem(
              child: Text(list.nombre + " " + list.apellido),
              value: list.id,
            );
          }).toList(),
        ),
      ],
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        //quita los caracteress de mas solo para dejar la fecha
        _fecha = _fecha.replaceRange(10, 23, '');
        _imputDateController.text = _fecha;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 8, minute: 1),
    );

    if (picked != null) {
      setState(() {
        _hora = picked.toString();
        //quita los caracteress de mas solo para dejar la hora
        _hora = _hora.replaceRange(0, 10, '');
        _hora = _hora.replaceRange(5, 6, '');
        _imputTimeController.text = _hora;
      });
    }
  }
}
