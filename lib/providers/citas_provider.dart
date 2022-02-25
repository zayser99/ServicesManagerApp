import 'package:flutter/material.dart';
import 'package:services_manager_app/models/citas_model.dart';
import 'package:services_manager_app/providers/db_provider.dart';

class CitasProvider extends ChangeNotifier {
  List<CitasModel> citas = [];

  Future<CitasModel> nuevaCita(
      int idd, String fecha, String hora, String comentario, int idcli) async {
    final nuevaCita = CitasModel(
      id: idd,
      fecha: fecha,
      hora: hora,
      comentario: comentario,
      idcliente: idcli,
      nomcliente: '',
      idpre: 0,
      status: 'PENDIENTE',
    );

    final id = await DBProvider.db.nuevaCita(nuevaCita);
    // Asignar el ID de la base de datos al modelo
    nuevaCita.id = id!;
    citas.add(nuevaCita);
    notifyListeners();
    return nuevaCita;
  }

  cargarCitas() async {
    final scans = await DBProvider.db.getTodosLasCitas();
    citas = [...scans];
    notifyListeners();
  }

  borrarCitaPorId(int id) async {
    await DBProvider.db.deleteCita(id);
    notifyListeners();
  }

  editarCita(CitasModel cita) async {
    await DBProvider.db.updateCita(cita);
    notifyListeners();
  }

  editarCita2(CitasModel cita) async {
    await DBProvider.db.updateCita(cita);
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
