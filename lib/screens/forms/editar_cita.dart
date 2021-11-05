import 'package:flutter/material.dart';

class EditarCita extends StatefulWidget {
  const EditarCita({Key? key}) : super(key: key);

  @override
  State<EditarCita> createState() => _EditarCitaState();
}

class _EditarCitaState extends State<EditarCita> {
  String dropdownValue = 'Sergio';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Editar Cita'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Editar Cita',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _showID('1'),
          const Divider(height: 60),
          _inputFecha(),
          const Divider(height: 60),
          _inputHora(),
          const Divider(height: 60),
          _inputCom(),
          const Divider(height: 60),
          _inputTipo(),
        ],
      ),
    );
  }

  Widget _showID(id) {
    return Row(
      children: [
        const Text('ID:', style: TextStyle(fontSize: 15)),
        const SizedBox(width: 20),
        Text(
          id,
          style: const TextStyle(fontSize: 20, color: Colors.indigo),
        ),
      ],
    );
  }

  Widget _inputFecha() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Fecha de la cita',
        labelText: 'Fecha',
        icon: const Icon(Icons.date_range),
      ),
    );
  }

  Widget _inputHora() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Hora de la cita',
        labelText: 'Hora',
        icon: const Icon(Icons.timer),
      ),
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
    );
  }

  Widget _inputTipo() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(Icons.account_circle_outlined, color: Colors.grey),
        ),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>[
            'Sergio',
            'Manuel ',
            'Pablo',
            'Alejandro',
            'Alejandra',
            'Pao'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
