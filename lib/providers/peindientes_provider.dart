import 'package:flutter/material.dart';
import 'package:services_manager_app/models/citas_model.dart';
import 'package:services_manager_app/providers/db_provider.dart';

class PendinetesProvider extends ChangeNotifier {
  List<CitasModel> pendientes = [];

  cargarPendientes() async {
    final scans = await DBProvider.db.getTodosPendientesDelDia();
    pendientes = [...scans];
    notifyListeners();
  }

  editarPendiente(CitasModel cita) async {
    await DBProvider.db.updateCita(cita);
    notifyListeners();
  }
}
