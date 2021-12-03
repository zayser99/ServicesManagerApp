import 'dart:convert';

CitasModel citasModelFromJson(String str) =>
    CitasModel.fromJson(json.decode(str));

String citasModelToJson(CitasModel data) => json.encode(data.toJsonForEdit());

class CitasModel {
  CitasModel({
    required this.id,
    required this.fecha,
    required this.hora,
    required this.comentario,
    required this.status,
    required this.idcliente,
    required this.nomcliente,
    required this.idpre,
  });

  int id;
  String fecha;
  String hora;
  String comentario;
  String status;
  int idcliente;
  String nomcliente;
  int? idpre;

  factory CitasModel.fromJson(Map<String, dynamic> json) => CitasModel(
        id: json["id_ci"],
        fecha: json["fecha_ci"],
        hora: json["hora_ci"],
        comentario: json["com_ci"],
        status: json["status_ci"],
        idcliente: json["id_cli"],
        nomcliente: json["nom_cli"] + " " + json["ape_cli"],
        idpre: json["id_pre"],
      );

  Map<String, dynamic> toJsonForInsert() => {
        "id_ci": null,
        "fecha_ci": fecha,
        "hora_ci": hora,
        "com_ci": comentario,
        "status_ci": status,
        "id_cli": idcliente,
        "id_pre": null,
      };
  Map<String, dynamic> toJsonForEdit() => {
        "id_ci": id,
        "fecha_ci": fecha,
        "hora_ci": hora,
        "com_ci": comentario,
        "status_ci": status,
        "id_cli": idcliente,
        "id_pre": null,
      };
}
