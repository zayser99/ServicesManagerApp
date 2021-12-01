import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/cliente_model.dart';
import 'package:services_manager_app/providers/clientes_provider.dart';
import 'package:services_manager_app/widgets/widgets.dart';

class ClientesScreen extends StatelessWidget {
  const ClientesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final clientesProvider = Provider.of<ClientesProvider>(context);
    clientesProvider.cargarClientes();
    final List<ClienteModel> clientes = clientesProvider.clientes;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search_outlined), onPressed: () => {}
              //   showSearch(context: context, delegate: MovieSearchDelegate()),
              )
        ],
      ),
      body: Column(
        children: [
          _botonAddCliente(size.height * 0.10, context, 'AgregarCliente'),
          _lisviewClientes(clientes),
        ],
      ),
    );
  }
}

Widget _botonAddCliente(alto, context, ruta) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, ruta);
    },
    child: SizedBox(
        width: double.infinity / 2,
        height: alto,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.indigo[400],
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                blurRadius: 5,
                spreadRadius: -1,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            children: const [
              Expanded(
                child: Text(
                  'cliente',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Icon(Icons.add, color: Colors.white),
            ],
          ),
        )),
  );
}

Widget _lisviewClientes(List<ClienteModel> clientes) {
  return Expanded(
    child: SizedBox(
      width: double.infinity,
      child: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (_, int index) {
          return TarjetaClientes(
            cliente: clientes[index],
          );
        },
      ),
    ),
  );
}
