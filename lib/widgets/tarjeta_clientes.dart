import 'package:flutter/material.dart';
import 'package:services_manager_app/models/cliente_model.dart';
import 'package:services_manager_app/providers/clientes_provider.dart';
import 'package:services_manager_app/providers/db_provider.dart';
import 'package:services_manager_app/screens/forms/editar_cliente.dart';

class TarjetaClientes extends StatefulWidget {
  final ClienteModel cliente;
  const TarjetaClientes({Key? key, required this.cliente}) : super(key: key);
  @override
  State<TarjetaClientes> createState() =>
      _TarjetaClientesState(cliente: cliente);
}

class _TarjetaClientesState extends State<TarjetaClientes> {
  final ClienteModel cliente;
  _TarjetaClientesState({required this.cliente});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
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
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                Expanded(child: Text('${cliente.id}'), flex: 1),
                const Expanded(
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.indigo,
                    ),
                    flex: 4),
              ],
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${cliente.nombre} ${cliente.apellido}',
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                cliente.numero,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.indigo),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                cliente.mail,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
              Text(
                cliente.rfc,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.indigo),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: _desplegableBorEdit(context)),
        ],
      ),
    );
  }

  Widget _desplegableBorEdit(context) {
    return PopupMenuButton<String>(
      child: const Icon(
        Icons.arrow_drop_down_circle_sharp,
        color: Colors.indigo,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Row(
            children: const [
              Expanded(child: Text("Eliminar")),
              Icon(
                Icons.delete,
                color: Colors.indigo,
              ),
            ],
          ),
          value: 'eliminar',
        ),
        PopupMenuItem(
          child: Row(
            children: const [
              Expanded(child: Text("Editar")),
              Icon(
                Icons.edit,
                color: Colors.indigo,
              ),
            ],
          ),
          value: 'EditarCliente',
        )
      ],
      onSelected: (route) {
        if (route == 'eliminar') {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.red),
                  ),
                  content: Text(
                    '¿Seguro que desea Eliminar a "${cliente.nombre} ${cliente.apellido}"?',
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancelar'),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.indigo),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        final clienteProvider = ClientesProvider();
                        clienteProvider.borrarClientePorId(cliente.id);
                        Navigator.pop(context, 'OK');
                      },
                      child:
                          const Text('OK', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                );
              });
        } else {
          final route = MaterialPageRoute(builder: (context) {
            return EditarCliente(cliente: cliente);
          });
          Navigator.push(context, route);
        }
      },
    );
  }
}
