import 'package:flutter/material.dart';
import 'package:services_manager_app/providers/clientes_provider.dart';

class AgregarCliente extends StatefulWidget {
  const AgregarCliente({Key? key}) : super(key: key);

  @override
  State<AgregarCliente> createState() => _AgregarClienteState();
}

class _AgregarClienteState extends State<AgregarCliente> {
  String _nombre = '';
  String _apellido = '';
  String _celular = '';
  String _rfc = '';
  String _mail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Agregar Cliente'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'agregar Cliente',
            onPressed: () {
              final clienteProvider = ClientesProvider();
              clienteProvider.nuevoCliente(
                0,
                _nombre,
                _apellido,
                _celular,
                _mail,
                _rfc,
              );
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

  Widget _inputNombre() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Nombre',
        labelText: 'Nombre',
        icon: const Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        _nombre = valor;
      },
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
      onChanged: (valor) {
        _apellido = valor;
      },
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
      onChanged: (valor) {
        _celular = valor;
      },
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
      onChanged: (valor) {
        _rfc = valor;
      },
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
      onChanged: (valor) {
        _mail = valor;
      },
    );
  }
}
