import 'package:flutter/material.dart';

class AgregarServicio extends StatefulWidget {
  const AgregarServicio({Key? key}) : super(key: key);

  @override
  State<AgregarServicio> createState() => _AgregarServicioState();
}

class _AgregarServicioState extends State<AgregarServicio> {
  String dropdownValue = 'Pintura';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Agregar Servicio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'agregar Servicio',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _inputNombre(),
          const Divider(height: 60),
          _inputTipo(),
          const Divider(height: 60),
          _inputPrecio(),
          const Divider(height: 60),
          _inputDesc(),
        ],
      ),
    );
  }

  Widget _inputNombre() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'nombre del servicio',
        labelText: 'Nombre',
        helperText: 'Lo mas descriptivo posible.',
        icon: const Icon(Icons.build_circle_outlined),
      ),
    );
  }

  Widget _inputPrecio() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Precio del servicio',
        labelText: 'Precio',
        icon: const Icon(Icons.monetization_on_outlined),
      ),
    );
  }

  Widget _inputDesc() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Descripción',
        labelText: 'Descripción',
        icon: const Icon(Icons.build_circle_outlined),
      ),
    );
  }

  Widget _inputTipo() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(Icons.build_circle_outlined, color: Colors.grey),
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
          items: <String>['Fontaneria', 'Electricidad', 'Decoracion', 'Pintura']
              .map<DropdownMenuItem<String>>((String value) {
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
