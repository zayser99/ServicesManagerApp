import 'package:flutter/material.dart';

class EditarCliente extends StatefulWidget {
  const EditarCliente({Key? key}) : super(key: key);

  @override
  State<EditarCliente> createState() => _EditarClienteState();
}

class _EditarClienteState extends State<EditarCliente> {
  String dropdownValue = 'Pintura';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Editar Cliente'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Editar Cliente',
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
          _inputNombre(),
          const Divider(height: 60),
          _inputApellido(),
          const Divider(height: 60),
          _inputNum(),
          const Divider(height: 60),
          _inputRFC(),
          const Divider(height: 60),
          _inputMail(),
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

  Widget _inputNombre() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Nombre',
        labelText: 'Nombre',
        icon: const Icon(Icons.account_circle),
      ),
    );
  }

  Widget _inputApellido() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Apellido',
        labelText: 'Apellido',
        icon: const Icon(Icons.account_circle),
      ),
    );
  }

  Widget _inputNum() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Numero Celular',
        labelText: 'Celular',
        icon: const Icon(Icons.smartphone),
      ),
    );
  }

  Widget _inputRFC() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'RFC',
        labelText: 'RFC',
        icon: const Icon(Icons.account_circle),
      ),
    );
  }

  Widget _inputMail() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Correo electronico',
        labelText: 'Correo',
        icon: const Icon(Icons.mail),
      ),
    );
  }
}
