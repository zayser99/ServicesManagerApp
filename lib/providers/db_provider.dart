import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// mis importaciones
import 'package:services_manager_app/models/cliente_model.dart';
export 'package:services_manager_app/models/cliente_model.dart';
import 'package:services_manager_app/models/tiposserv_model.dart';
export 'package:services_manager_app/models/tiposserv_model.dart';
import 'package:services_manager_app/models/servicios_model.dart';
export 'package:services_manager_app/models/servicios_model.dart';
import 'package:services_manager_app/models/citas_model.dart';
export 'package:services_manager_app/models/citas_model.dart';
import 'package:services_manager_app/models/presupuesto_model.dart';
import 'package:services_manager_app/models/presupuestoservicio_model.dart';
export 'package:services_manager_app/models/presupuesto_model.dart';
export 'package:services_manager_app/models/presupuestoservicio_model.dart';
import 'package:services_manager_app/models/eventosservicios_model.dart';
export 'package:services_manager_app/models/eventosservicios_model.dart';
import 'package:services_manager_app/models/eventos_model.dart';
export 'package:services_manager_app/models/eventos_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'service.db');
    //  print(path);

    // Crear base de datos
    return await openDatabase(path, version: 2, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE "TIPOSERVICIO" (
            "id_tserv"	INTEGER,
            "nom_tserv"	TEXT,
            PRIMARY KEY("id_tserv" AUTOINCREMENT)
          );      
        ''');
      await db.execute('''
          CREATE TABLE "SERVICIOS" (
            "id_serv"	INTEGER,
            "nom_serv"	TEXT,
            "prec_serv"	REAL,
            "desc_serv"	TEXT,
            "id_tserv"	INTEGER,
            FOREIGN KEY("id_tserv") REFERENCES "TIPOSERVICIO"("id_tserv") ON UPDATE CASCADE ON DELETE CASCADE,
            PRIMARY KEY("id_serv" AUTOINCREMENT)
          );
        ''');
      await db.execute('''
          CREATE TABLE "CLIENTES" (
            "id_cli"	INTEGER,
            "nom_cli"	TEXT,
            "ape_cli"	TEXT,
            "num_cli"	TEXT,
            "mail_cli"	TEXT,
            "rfc_cli"	TEXT,
            PRIMARY KEY("id_cli" AUTOINCREMENT)
          );      
        ''');
      await db.execute('''
          CREATE TABLE "PRESUPUESTOS" (
            "id_pre"	INTEGER,
            "fecha_pre"	TEXT,
            "total_pre"	REAL,
            "com__pre"	TEXT,
            "id_cli"	INTEGER,
            FOREIGN KEY("id_cli") REFERENCES "CLIENTES"("id_cli") ON UPDATE CASCADE ON DELETE CASCADE,
            PRIMARY KEY("id_pre" AUTOINCREMENT)
          );      
        ''');
      await db.execute('''
          CREATE TABLE "EVENTOS" (
            "id_ev"	INTEGER,
            "fecha_ev"	TEXT,
            "hora_ev"	TEXT,
            "total_ev"	REAL,
            "com_ev"	TEXT,
            "id_cli"	INTEGER,
            FOREIGN KEY("id_cli") REFERENCES "CLIENTES"("id_cli") ON UPDATE CASCADE ON DELETE CASCADE,
            PRIMARY KEY("id_ev" AUTOINCREMENT)
          );      
        ''');
      await db.execute('''
          CREATE TABLE "PRESUPUESTO_SERVICIO" (
            "id_preserv"	INTEGER,
            "com_preserv"	TEXT,
            "cant_preserv"	INTEGER,
            "id_pre"	INTEGER,
            "id_serv"	INTEGER,
            FOREIGN KEY("id_pre") REFERENCES "PRESUPUESTOS"("id_pre") ON UPDATE CASCADE ON DELETE CASCADE,
            FOREIGN KEY("id_serv") REFERENCES "SERVICIOS"("id_serv") ON UPDATE CASCADE ON DELETE CASCADE,
            PRIMARY KEY("id_preserv" AUTOINCREMENT)
          );      
        ''');
      await db.execute('''
          CREATE TABLE "EVENTO_SERVICIO" (
            "id_evserv"	INTEGER,
            "com_evserv"	TEXT,
            "cant_evserv"	INTEGER,
            "id_ev"	INTEGER,
            "id_serv"	INTEGER,
            FOREIGN KEY("id_serv") REFERENCES "SERVICIOS"("id_serv") ON UPDATE CASCADE ON DELETE CASCADE,
            FOREIGN KEY("id_ev") REFERENCES "EVENTOS"("id_ev") ON UPDATE CASCADE ON DELETE CASCADE,
            PRIMARY KEY("id_evserv" AUTOINCREMENT)
          );      
        ''');
      await db.execute('''
          CREATE TABLE "CITAS" (
            "id_ci"	INTEGER,
            "fecha_ci"	TEXT,
            "hora_ci"	TEXT,
            "com_ci"	TEXT,
            "status_ci"	TEXT,
            "id_cli"	INTEGER,
            "id_pre"	INTEGER,
            FOREIGN KEY("id_pre") REFERENCES "PRESUPUESTOS"("id_pre") ON UPDATE CASCADE ON DELETE CASCADE,
            FOREIGN KEY("id_cli") REFERENCES "CLIENTES"("id_cli") ON UPDATE CASCADE ON DELETE CASCADE,
            PRIMARY KEY("id_ci" AUTOINCREMENT)
          );      
        ''');
    });
  }

  Future<List<ClienteModel>> getTodosLosClientes() async {
    final db = await database;
    final res = await db!.query('CLIENTES');

    return res.isNotEmpty
        ? res.map((s) => ClienteModel.fromJson(s)).toList()
        : [];
  }

// DB CLIENTES
  Future<int?> nuevoCliente(ClienteModel nuevoCliente) async {
    final db = await database;
    final res = await db?.insert('CLIENTES', nuevoCliente.toJsonToInsert());
    return res;
  }

  Future<int> updateCliente(ClienteModel nuevoCliente) async {
    final db = await database;
    final res = await db!.update('CLIENTES', nuevoCliente.toJsonToEdit(),
        where: 'id_cli = ?', whereArgs: [nuevoCliente.id]);
    return res;
  }

  Future<int> deleteCliente(int id) async {
    final db = await database;
    final res =
        await db!.delete('CLIENTES', where: 'id_cli = ?', whereArgs: [id]);
    return res;
  }

  // nuevoClienteRow(ClienteModel nuevoCliente) async {
  //   final id = nuevoCliente.id;
  //   final nombre = nuevoCliente.nombre;
  //   final apellido = nuevoCliente.apellido;
  //   final numero = nuevoCliente.numero;
  //   final mail = nuevoCliente.mail;
  //   final rfc = nuevoCliente.rfc;

  //   final db = await database;
  //   final res = await db?.rawInsert('''
  //    INSERT INTO Clientes(id_cli, nom_cli, ape_cli, num_cli, mail_cli, rfc_cli)
  //    VALUES ($id, '$nombre', '$apellido', '$numero' , '$mail' , '$rfc')
  //   ''');
  //   return res;
  // }

  // Future<ClienteModel?> getClienteById(int id) async {
  //   final db = await database;
  //   final res =
  //       await db!.query('CLIENTES', where: 'id_cli = ?', whereArgs: [id]);
  //   return res.isNotEmpty ? ClienteModel.fromJson(res.first) : null;
  // }

  // Future<List<ScanModel>> getScansPorTipo(String tipo) async {
  //   final db = await database;
  //   final res = await db.rawQuery('''
  //     SELECT * FROM Scans WHERE tipo = '$tipo'
  //   ''');

  //   return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  // }

  // Future<int> deleteAllScans() async {
  //   final db = await database;
  //   final res = await db!.rawDelete('''
  //     DELETE FROM PRESUPUESTOS where id_cli=1;
  //   ''');
  //   return res;
  // }

//SERVICIOS Y TIPOS DE SERVICIOS
  Future<int?> nuevoServicio(ServiciosModel nuevoServicio) async {
    final db = await database;
    final res = await db?.insert('SERVICIOS', nuevoServicio.toJsonToInsert());
    return res;
  }

  Future<int?> nuevoTipoServicio(TiposservModel nuevoTipoServicio) async {
    final db = await database;
    final res =
        await db?.insert('TIPOSERVICIO', nuevoTipoServicio.toJsonForInsert());
    return res;
  }

  Future<List<ServiciosModel>> getTodosLosServicios() async {
    final db = await database;
    final res = await db!.query('SERVICIOS');

    return res.isNotEmpty
        ? res.map((s) => ServiciosModel.fromJson(s)).toList()
        : [];
  }

  Future<List<TiposservModel>> getTodosLosTiposServicios() async {
    final db = await database;
    final res = await db!.query('TIPOSERVICIO');

    return res.isNotEmpty
        ? res.map((s) => TiposservModel.fromJson(s)).toList()
        : [];
  }

  Future<int> updateServicio(ServiciosModel nuevoServicio) async {
    final db = await database;
    final res = await db!.update('SERVICIOS', nuevoServicio.toJsonToEdit(),
        where: 'id_serv = ?', whereArgs: [nuevoServicio.id]);
    return res;
  }

  Future<int> deleteServicio(int id) async {
    final db = await database;
    final res =
        await db!.delete('SERVICIOS', where: 'id_serv = ?', whereArgs: [id]);
    return res;
  }

  Future<TiposservModel?> getTipoServicioById(int id) async {
    final db = await database;
    final res =
        await db!.query('TIPOSERVICIO', where: 'id_tserv = ?', whereArgs: [id]);
    return res.isNotEmpty ? TiposservModel.fromJson(res.first) : null;
  }

  // CITAS
  Future<List<CitasModel>> getTodosLasCitas() async {
    final db = await database;
    final res = await db!.rawQuery(
        'SELECT id_ci, fecha_ci, hora_ci, com_ci, status_ci, id_cli, nom_cli, ape_cli, id_pre FROM CITAS NATURAL JOIN CLIENTES ');

    return res.isNotEmpty
        ? res.map((s) => CitasModel.fromJson(s)).toList()
        : [];
  }

  Future<int?> nuevaCita(CitasModel nuevaCita) async {
    final db = await database;
    final res = await db?.insert('CITAS', nuevaCita.toJsonForInsert());
    return res;
  }

  Future<int> updateCita(CitasModel nuevaCita) async {
    final db = await database;
    final res = await db!.update('CITAS', nuevaCita.toJsonForEdit(),
        where: 'id_ci = ?', whereArgs: [nuevaCita.id]);
    return res;
  }

  Future<int> deleteCita(int id) async {
    final db = await database;
    final res = await db!.delete('CITAS', where: 'id_ci = ?', whereArgs: [id]);
    return res;
  }

// este es compartido entre eventos y servicios y sirbe para llenar los search delegates de respuestas
  Future<List<ServiciosModel>> getSerchServicios(String buscando) async {
    final db = await database;
    final res = await db!
        .rawQuery('SELECT * FROM SERVICIOS WHERE	nom_serv LIKE "%$buscando%"');

    return res.isNotEmpty
        ? res.map((s) => ServiciosModel.fromJson(s)).toList()
        : [];
  }

  //Cotizaciones y su carrito

  Future<List<PresupuestoserviciosModel>> getServiciosDelPres(int id) async {
    final db = await database;
    final res = await db!.rawQuery(
        'SELECT id_pre, id_serv, id_preserv, cant_preserv, nom_serv, prec_serv FROM PRESUPUESTO_SERVICIO NATURAL JOIN SERVICIOS WHERE id_pre= $id;');

    return res.isNotEmpty
        ? res.map((s) => PresupuestoserviciosModel.fromJson(s)).toList()
        : [];
  }

  Future<List<PresupuestoModel>> getTodosLosPresupuestos() async {
    final db = await database;
    final res = await db!.rawQuery(
        'SELECT id_pre, fecha_pre, total_pre, com__pre, id_cli, nom_cli, ape_cli from PRESUPUESTOS NATURAL JOIN CLIENTES');

    return res.isNotEmpty
        ? res.map((s) => PresupuestoModel.fromJson(s)).toList()
        : [];
  }

  Future<int?> nuevoPresupuesto(PresupuestoModel nuevoPresupuesto) async {
    final db = await database;
    final res =
        await db?.insert('PRESUPUESTOS', nuevoPresupuesto.toJsonforInsert());
    return res;
  }

  Future<int> updatePresupuesto(PresupuestoModel nuevoPresupuesto) async {
    final db = await database;
    final res = await db!.update('PRESUPUESTOS', nuevoPresupuesto.toJson(),
        where: 'id_pre = ?', whereArgs: [nuevoPresupuesto.id]);
    return res;
  }

  Future<int> deletePresupuesto(int id) async {
    final db = await database;
    final res =
        await db!.delete('PRESUPUESTOS', where: 'id_pre = ?', whereArgs: [id]);
    return res;
  }

  Future<int?> nuevoServiciodelPre(
      PresupuestoserviciosModel nuevoPresupuesto) async {
    final db = await database;
    final res = await db?.insert(
        'PRESUPUESTO_SERVICIO', nuevoPresupuesto.toJsonForInsert());
    return res;
  }

  Future<double?> sumaTotalPresupuesto(id) async {
    final db = await database;
    final res = await db?.rawQuery(
        'SELECT  sum(prec_serv *cant_preserv) as total FROM PRESUPUESTO_SERVICIO NATURAL JOIN SERVICIOS WHERE id_pre= $id;');
    var variable = res.toString();
    variable = variable
        .replaceAll("{", "")
        .replaceAll("}", "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(": ", "")
        .replaceAll("total", "");
    if (variable == 'null') return 0;

    return double.parse(variable);
  }

  Future<int> deleteServicioDelPre(int id) async {
    final db = await database;
    final res = await db!.delete('PRESUPUESTO_SERVICIO',
        where: 'id_preserv = ?', whereArgs: [id]);
    return res;
  }

  //Eventos y su carrito

  // Future<List<ServiciosModel>> getSerchServicios(String buscando) async {
  //   final db = await database;
  //   final res = await db!
  //       .rawQuery('SELECT * FROM SERVICIOS WHERE	nom_serv LIKE "%$buscando%"');

  //   return res.isNotEmpty
  //       ? res.map((s) => ServiciosModel.fromJson(s)).toList()
  //       : [];
  // }

  Future<List<EventosserviciosModel>> getServiciosDelEve(int id) async {
    final db = await database;
    final res = await db!.rawQuery(
        'SELECT id_ev, id_serv, id_evserv, cant_evserv, nom_serv, prec_serv FROM EVENTO_SERVICIO NATURAL JOIN SERVICIOS WHERE id_ev= $id;');

    return res.isNotEmpty
        ? res.map((s) => EventosserviciosModel.fromJson(s)).toList()
        : [];
  }

  Future<List<EventosModel>> getTodosLosEventos() async {
    final db = await database;
    final res = await db!.rawQuery(
        'SELECT id_ev, fecha_ev, hora_ev, total_ev, com_ev, id_cli, nom_cli, ape_cli from EVENTOS NATURAL JOIN CLIENTES');

    return res.isNotEmpty
        ? res.map((s) => EventosModel.fromJson(s)).toList()
        : [];
  }

  Future<int?> nuevoEvento(EventosModel nuevoEvento) async {
    final db = await database;
    final res = await db?.insert('EVENTOS', nuevoEvento.toJsonforInsert());
    return res;
  }

  Future<int> updateEvento(EventosModel nuevoEvento) async {
    final db = await database;
    final res = await db!.update('EVENTOS', nuevoEvento.toJson(),
        where: 'id_ev = ?', whereArgs: [nuevoEvento.id]);
    return res;
  }

  Future<int> deleteEvento(int id) async {
    final db = await database;
    final res =
        await db!.delete('EVENTOS', where: 'id_ev = ?', whereArgs: [id]);
    return res;
  }

  Future<int?> nuevoServiciodelEve(EventosserviciosModel nuevoEvento) async {
    final db = await database;
    final res =
        await db?.insert('EVENTO_SERVICIO', nuevoEvento.toJsonForInsert());
    return res;
  }

  Future<double?> sumaTotalEvento(id) async {
    final db = await database;
    final res = await db?.rawQuery(
        'SELECT  sum(prec_serv *cant_evserv) as total FROM EVENTO_SERVICIO NATURAL JOIN SERVICIOS WHERE id_ev=$id;');
    var variable = res.toString();
    variable = variable
        .replaceAll("{", "")
        .replaceAll("}", "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(": ", "")
        .replaceAll("total", "");
    if (variable == 'null') return 0;

    return double.parse(variable);
  }

  Future<int> deleteServicioDelEve(int id) async {
    final db = await database;
    final res = await db!
        .delete('EVENTO_SERVICIO', where: 'id_evserv = ?', whereArgs: [id]);
    return res;
  }
}
