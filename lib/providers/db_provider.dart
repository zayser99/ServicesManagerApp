import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// mis importaciones
import 'package:services_manager_app/models/cliente_model.dart';
export 'package:services_manager_app/models/cliente_model.dart';

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
  //   final res = await db.rawDelete('''
  //     DELETE FROM Scans
  //   ''');
  //   return res;
  // }
}
