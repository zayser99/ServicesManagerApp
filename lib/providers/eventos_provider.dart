import 'package:flutter/material.dart';
import 'package:services_manager_app/providers/db_provider.dart';

class EventosProvider extends ChangeNotifier {
  List<EventosModel> eventos = [];
  List<EventosserviciosModel> serviciosDelEvento = [];
  double totalDelEve = 0;

  Future<int> nuevoEvento(
      String com, String fecha, String hora, int idCli, double total) async {
    final nuevoEvento = EventosModel(
        id: 0,
        comentario: com,
        fecha: fecha,
        hora: hora,
        idcliente: idCli,
        nomcliente: '',
        total: total);

    final id = await DBProvider.db.nuevoEvento(nuevoEvento);
    // Asignar el ID de la base de datos al modelo
    nuevoEvento.id = id!;
    eventos.add(nuevoEvento);
    notifyListeners();
    return id;
  }

  cargarEventos() async {
    final scans = await DBProvider.db.getTodosLosEventos();
    eventos = [...scans];
    notifyListeners();
  }

  borrarEventoPorId(int id) async {
    await DBProvider.db.deleteEvento(id);
    notifyListeners();
  }

  editarEvento(EventosModel evento) async {
    await DBProvider.db.updateEvento(evento);
    limpiarVariables();
    notifyListeners();
  }

// ///////////////////
  Future<List<ServiciosModel>> cargarServiciosEncontrados(
      String buscado) async {
    final serviciosBuscados = await DBProvider.db.getSerchServicios(buscado);
    return serviciosBuscados;
  }

  Future<int> nuevoServicioDelEve(int idEve, int idserv) async {
    final nuevoServDelEve = EventosserviciosModel(
      id: 0,
      cantidad: 1,
      idEv: idEve,
      idserv: idserv,
      nomserv: '',
      precioU: 0,
    );
    final id = await DBProvider.db.nuevoServiciodelEve(nuevoServDelEve);
    // Asignar el ID de la base de datos al modelo
    nuevoServDelEve.id = id!;
    notifyListeners();
    return id;
  }

  cargarServiciosDelEve(int id) async {
    final scans = await DBProvider.db.getServiciosDelEve(id);
    serviciosDelEvento = [...scans];
    notifyListeners();
  }

  cargarTotalDelEvento(id) async {
    final total = await DBProvider.db.sumaTotalEvento(id);
    totalDelEve = total!;
    notifyListeners();
  }

  borrarServicioDelEvePorId(int id) async {
    await DBProvider.db.deleteServicioDelEve(id);
    notifyListeners();
  }

  limpiarVariables() async {
    totalDelEve = 0;
    serviciosDelEvento = [];
  }

  String stringTicketEvento(EventosModel evento) {
    String ticket = 'EVENTO\n\n';

    ticket = ticket + 'cantidad  P/U   IMPORTE \n\n';
    for (var servicio in serviciosDelEvento) {
      ticket = ticket + '${servicio.nomserv}\n';
      ticket = ticket +
          '${servicio.cantidad}   ${servicio.precioU}   ${servicio.cantidad * servicio.precioU} \n\n';
    }
    ticket = ticket + 'TOTAL: \$ ${evento.total} MNX \n\n';
    ticket = ticket + ' ${evento.fecha} a las ${evento.hora} \n';
    return ticket;
  }
}
