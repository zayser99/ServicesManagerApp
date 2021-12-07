import 'package:flutter/material.dart';

class AgregarEvento extends StatefulWidget {
  const AgregarEvento({Key? key}) : super(key: key);

  @override
  State<AgregarEvento> createState() => _AgregarEventoState();
}

class _AgregarEventoState extends State<AgregarEvento> {
  String dropdownValue = 'Sergio';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Agregar Evento'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'agregar Evento',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            _showID('1'),
            const Divider(height: 10),
            _inputTipo(),
            const Divider(height: 10),
            _inputCom(),
            const Divider(height: 10),
            _showTotal('0'),
            const Divider(height: 20),
            _lisviewServicios(),
            const Divider(height: 10),
            _inputBuscarServicio()
          ],
        ),
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

  Widget _showTotal(total) {
    return Row(
      children: [
        const Text('TOTAL:',
            style: TextStyle(fontSize: 20, color: Colors.indigo)),
        const SizedBox(width: 20),
        Text(
          "\$" + total + " MNX",
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget _inputCom() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Comentario de la cotizacion',
        labelText: 'Comentario',
        icon: const Icon(Icons.list),
      ),
    );
  }

  Widget _inputBuscarServicio() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Buscar Servicio',
        labelText: 'Agregar Servicio',
        icon: const Icon(Icons.search, color: Colors.indigo),
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

  Widget _lisviewServicios() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: 0,
          itemBuilder: (BuildContext context, int index) {
            return Container();
            // return const TarjetaServiciosMini();
          },
        ),
      ),
    );
  }
}
