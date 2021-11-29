import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'service_manager_app.db');
    print(path);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''       
            CREATE TABLE TIPOSERVICIO (
              id_tserv	INTEGER,
              nom_tserv	TEXT,
              PRIMARY KEY(id_tserv)
            );

            CREATE TABLE SERVICIOS (
              id_serv	INTEGER,
              nom_serv	TEXT,
              prec_serv	REAL,
              desc_serv	TEXT,
              id_tserv	INTEGER,
              FOREIGN KEY(id_tserv) REFERENCES TIPOSERVICIO(id_tserv) ON UPDATE CASCADE ON DELETE CASCADE,
              PRIMARY KEY(id_serv)
            );

            CREATE TABLE CLIENTES (
              id_cli	INTEGER,
              nom_cli	TEXT,
              ape_cli	TEXT,
              num_cli	TEXT,
              mail_cli	TEXT,
              rfc_cli	TEXT,
              PRIMARY KEY(id_cli)
            );

            CREATE TABLE PRESUPUESTOS (
              id_pre	INTEGER,
              fecha_pre	TEXT,
              total_pre	REAL,
              com__pre	TEXT,
              id_cli	INTEGER,
              FOREIGN KEY(id_cli) REFERENCES CLIENTES(id_cli) ON UPDATE CASCADE ON DELETE CASCADE,
              PRIMARY KEY(id_pre)
            );

            CREATE TABLE EVENTOS (
              id_ev	INTEGER,
              fecha_ev	TEXT,
              hora_ev	TEXT,
              total_ev	REAL,
              com_ev	TEXT,
              id_cli	INTEGER,
              FOREIGN KEY(id_cli) REFERENCES CLIENTES(id_cli) ON UPDATE CASCADE ON DELETE CASCADE,
              PRIMARY KEY(id_ev),
            );

            CREATE TABLE PRESUPUESTO_SERVICIO (
              id_preserv	INTEGER,
              com_preserv	TEXT,
              cant_preserv	INTEGER,
              id_pre	INTEGER,
              id_serv	INTEGER,
              FOREIGN KEY(id_pre) REFERENCES PRESUPUESTOS(id_pre) ON UPDATE CASCADE ON DELETE CASCADE,
              FOREIGN KEY(id_serv) REFERENCES SERVICIOS(id_serv) ON UPDATE CASCADE ON DELETE CASCADE,
              PRIMARY KEY(id_preserv)
            );

            CREATE TABLE EVENTO_SERVICIO (
              id_evserv	INTEGER,
              com_evserv	TEXT,
              cant_evserv	INTEGER,
              id_ev	INTEGER,
              id_serv	INTEGER,
              FOREIGN KEY(id_serv) REFERENCES SERVICIOS(id_serv) ON UPDATE CASCADE ON DELETE CASCADE,
              FOREIGN KEY(id_ev) REFERENCES EVENTOS(id_ev) ON UPDATE CASCADE ON DELETE CASCADE,
              PRIMARY KEY(id_evserv)
            );

            CREATE TABLE CITAS (
              id_ci	INTEGER,
              fecha_ci	TEXT,
              hora_ci	TEXT,
              com_ci	TEXT,
              status_ci	TEXT,
              id_cli	INTEGER,
              id_pre	INTEGER,
              FOREIGN KEY(id_pre) REFERENCES PRESUPUESTOS(id_pre) ON UPDATE CASCADE ON DELETE CASCADE,
              FOREIGN KEY(id_cli) REFERENCES CLIENTES(id_cli) ON UPDATE CASCADE ON DELETE CASCADE,
              PRIMARY KEY(id_ci)
            );


          ''');
      },
    );
  }
}
