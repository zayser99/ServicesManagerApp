import 'package:flutter/material.dart';
import 'package:services_manager_app/providers/db_provider.dart';

class ClientesProvider extends ChangeNotifier {
  List<ClienteModel> clientes = [];

  Future<ClienteModel> nuevoCliente(int idd, String nombre, String apellido,
      String numero, String mail, String rfc) async {
    final nuevoCliente = ClienteModel(
        id: idd,
        nombre: nombre,
        apellido: apellido,
        numero: numero,
        mail: mail,
        rfc: rfc);

    final id = await DBProvider.db.nuevoCliente(nuevoCliente);
    // Asignar el ID de la base de datos al modelo
    nuevoCliente.id = id!;
    clientes.add(nuevoCliente);
    notifyListeners();
    return nuevoCliente;
  }

  cargarClientes() async {
    final scans = await DBProvider.db.getTodosLosClientes();
    clientes = [...scans];
    notifyListeners();
  }

  borrarClientePorId(int id) async {
    await DBProvider.db.deleteCliente(id);
    clientes = [];
    cargarClientes();
    notifyListeners();
  }

  editarCliente(ClienteModel cliente) async {
    await DBProvider.db.updateCliente(cliente);
    notifyListeners();
  }
  // cargarScanPorTipo(String tipo) async {
  //   // final scans = await DBProvider.db.getScansPorTipo(tipo);
  //   clientes = [...clientes];

  //   notifyListeners();
  // }

  // borrarTodos() async {
  //   // await DBProvider.db.deleteAllScans();
  //   clientes = [];
  //   notifyListeners();
  // }
}
