// To parse this JSON data, do
//
//     final citasModel = citasModelFromJson(jsonString);

import 'dart:convert';

CitasModel citasModelFromJson(String str) => CitasModel.fromJson(json.decode(str));

String citasModelToJson(CitasModel data) => json.encode(data.toJson());

class CitasModel {
    CitasModel({
        required this.idci,
        required this.fecha,
        required this.hora,
        required this.comentario,
        required this.status,
        required this.idcliente,
        required this.nomcliente,
        required this.idpre,
    });

    int idci;
    String fecha;
    String hora;
    String comentario;
    bool status;
    int idcliente;
    String nomcliente;
    int idpre;

    factory CitasModel.fromJson(Map<String, dynamic> json) => CitasModel(
        idci: json["id_ci"],
        fecha: json["fecha_ci"],
        hora: json["hora_ci"],
        comentario: json["com_ci"],
        status: json["status_ci"],
        idcliente: json["id_cli"],
        nomcliente: json["nom_cli"],
        idpre: json["id_pre"],
    );

    Map<String, dynamic> toJson() => {
        "id_ci": idci,
        "fecha_ci": fecha,
        "hora_ci": hora,
        "com_ci": comentario,
        "status_ci": status,
        "id_cli": idcliente,
        "nom_cli": nomcliente,
        "id_pre": idpre,
    };
}
