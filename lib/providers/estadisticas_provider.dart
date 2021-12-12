import 'package:flutter/material.dart';
import 'package:services_manager_app/providers/db_provider.dart';

class EstadisticasProvider extends ChangeNotifier {
  int servicios = 0;
  double ganancias = 0;
  int pendinetes = 0;
  int clientes = 0;

  cargarTotalDeServicios() async {
    final total = await DBProvider.db.totaldeServiciosDelMes();
    servicios = total!;
    notifyListeners();
  }

  cargarTotalGanancias() async {
    final total = await DBProvider.db.totaldegananciasDelMes();
    ganancias = total!;
    notifyListeners();
  }

  cargarTotalpendientes() async {
    final total = await DBProvider.db.totalPendientesDelMes();
    pendinetes = total!;
    notifyListeners();
  }

  cargarTotalClientes() async {
    final total = await DBProvider.db.totalClientesAtendidos();
    clientes = total!;
    notifyListeners();
  }
}
