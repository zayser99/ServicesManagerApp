import 'package:flutter/material.dart';
import 'package:services_manager_app/providers/db_provider.dart';

class ServiciosProvider extends ChangeNotifier {
  List<ServiciosModel> servicios = [];
  List<TiposservModel> tipoServicios = [];

  Future<TiposservModel> nuevoTipoServicio(int idd, String nombre) async {
    final nuevoTipoServicio = TiposservModel(id: idd, nombre: nombre);
    final id = await DBProvider.db.nuevoTipoServicio(nuevoTipoServicio);
    // Asignar el ID de la base de datos al modelo
    nuevoTipoServicio.id = id!;
    tipoServicios.add(nuevoTipoServicio);
    notifyListeners();
    return nuevoTipoServicio;
  }

  Future<ServiciosModel> nuevoServicio(
      int idd, String nombre, String desc, int idTipo, double precio) async {
    final nuevoServicio = ServiciosModel(
      id: idd,
      nombre: nombre,
      descripcion: desc,
      idts: idTipo,
      precio: precio,
    );
    final id = await DBProvider.db.nuevoServicio(nuevoServicio);
    // Asignar el ID de la base de datos al modelo
    nuevoServicio.id = id!;
    servicios.add(nuevoServicio);
    notifyListeners();
    return nuevoServicio;
  }

  cargarTiposServicios() async {
    final scans = await DBProvider.db.getTodosLosTiposServicios();
    tipoServicios = [...scans];
    notifyListeners();
  }

  cargarServicios() async {
    final scans = await DBProvider.db.getTodosLosServicios();
    servicios = [...scans];
    notifyListeners();
  }

  borrarServicioPorId(int id) async {
    await DBProvider.db.deleteServicio(id);
    servicios = [];
    cargarServicios();
    notifyListeners();
  }

  editarServicio(ServiciosModel servicio) async {
    await DBProvider.db.updateServicio(servicio);
    notifyListeners();
  }

  String obtenerTipoServicioById(int id) {
    String nombre = '';
    for (var item in tipoServicios) {
      if (item.id == id) {
        nombre = item.nombre;
      }
    }
    return nombre;
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
