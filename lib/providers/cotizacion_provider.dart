import 'package:flutter/material.dart';
import 'package:services_manager_app/providers/db_provider.dart';

class CotizacionProvider extends ChangeNotifier {
  List<PresupuestoModel> presupuestos = [];
  List<PresupuestoserviciosModel> serviciosDelPresupuesto = [];
  double totalDelPre = 0;

  Future<int> nuevoPresupuesto(
      String com, String fecha, int idCli, double total) async {
    final nuevoPresupuesto = PresupuestoModel(
      id: 0,
      comentario: com,
      fecha: fecha,
      idcliente: idCli,
      nomcliente: '',
      total: total,
    );

    final id = await DBProvider.db.nuevoPresupuesto(nuevoPresupuesto);
    // Asignar el ID de la base de datos al modelo
    nuevoPresupuesto.id = id!;
    presupuestos.add(nuevoPresupuesto);
    notifyListeners();
    return id;
  }

  cargarPresupuestos() async {
    final scans = await DBProvider.db.getTodosLosPresupuestos();
    presupuestos = [...scans];
    notifyListeners();
  }

  borrarPresupuestoPorId(int id) async {
    await DBProvider.db.deletePresupuesto(id);
    notifyListeners();
  }

  editarPresupuesto(PresupuestoModel presupuesto) async {
    await DBProvider.db.updatePresupuesto(presupuesto);
    limpiarVariables();
    notifyListeners();
  }

// ///////////////////
  Future<List<ServiciosModel>> cargarServiciosEncontrados(
      String buscado) async {
    final serviciosBuscados = await DBProvider.db.getSerchServicios(buscado);
    return serviciosBuscados;
  }

  Future<int> nuevoServicioDelPre(int idpre, int idserv) async {
    final nuevoServDelPre = PresupuestoserviciosModel(
      id: 0,
      cantidad: 1,
      idp: idpre,
      idserv: idserv,
      nomserv: '',
      precioU: 0,
    );
    final id = await DBProvider.db.nuevoServiciodelPre(nuevoServDelPre);
    // Asignar el ID de la base de datos al modelo
    nuevoServDelPre.id = id!;
    notifyListeners();
    return id;
  }

  cargarServiciosDelPre(int id) async {
    final scans = await DBProvider.db.getServiciosDelPres(id);
    serviciosDelPresupuesto = [...scans];
    notifyListeners();
  }

  cargarTotalDelPresupuesto(id) async {
    final total = await DBProvider.db.sumaTotalPresupuesto(id);
    totalDelPre = total!;
    notifyListeners();
  }

  borrarServicioDelPrePorId(int id) async {
    await DBProvider.db.deleteServicioDelPre(id);
    notifyListeners();
  }

  limpiarVariables() async {
    totalDelPre = 0;
    serviciosDelPresupuesto = [];
  }

  String stringTicketCotizacion(PresupuestoModel presupuesto) {
    String ticket = 'COTIZACIÓN\n\n';
    ticket = ticket + 'folio: #${presupuesto.id}\n\n\n';

    ticket = ticket + 'cantidad    P/U     IMPORTE \n\n';
    for (var servicio in serviciosDelPresupuesto) {
      ticket = ticket + '${servicio.nomserv}\n';
      ticket = ticket +
          '${servicio.cantidad}         ${servicio.precioU}         ${servicio.cantidad * servicio.precioU} \n';
    }
    ticket = ticket + '\n\nTOTAL: \$ ${presupuesto.total} MNX \n\n';
    ticket = ticket + '\n\npara el Cliente: ${presupuesto.nomcliente}  \n\n';
    ticket = ticket + '${presupuesto.fecha} \n';
    return ticket;
  }
}
