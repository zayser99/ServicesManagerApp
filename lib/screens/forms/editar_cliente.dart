import 'package:flutter/material.dart';
import 'package:services_manager_app/models/cliente_model.dart';
import 'package:services_manager_app/providers/clientes_provider.dart';

class EditarCliente extends StatefulWidget {
  final ClienteModel cliente;
  const EditarCliente({Key? key, required this.cliente}) : super(key: key);

  @override
  State<EditarCliente> createState() => _EditarClienteState(cliente: cliente);
}

class _EditarClienteState extends State<EditarCliente> {
  final ClienteModel cliente;
  _EditarClienteState({required this.cliente});
  String _nombre = '';
  String _apellido = '';
  String _celular = '';
  String _rfc = '';
  String _mail = '';
  @override
  Widget build(BuildContext context) {
    _nombre = cliente.nombre;
    _apellido = cliente.apellido;
    _celular = cliente.numero;
    _rfc = cliente.rfc;
    _mail = cliente.mail;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Editar Cliente'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Editar Cliente',
            onPressed: () {
              cliente.nombre = _nombre;
              cliente.apellido = _apellido;
              cliente.numero = _celular;
              cliente.rfc = _rfc;
              cliente.mail = _mail;
              final clienteProvider = ClientesProvider();
              clienteProvider.editarCliente(cliente);

              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _showID('${cliente.id}'),
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
    return TextFormField(
      initialValue: cliente.nombre,
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
    return TextFormField(
      initialValue: cliente.apellido,
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
    return TextFormField(
      initialValue: cliente.numero,
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
    return TextFormField(
      initialValue: cliente.rfc,
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
    return TextFormField(
      initialValue: cliente.mail,
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
