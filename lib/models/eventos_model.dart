import 'dart:convert';

EventosModel eventosModelFromJson(String str) => EventosModel.fromJson(json.decode(str));

String eventosModelToJson(EventosModel data) => json.encode(data.toJson());

class EventosModel {
    EventosModel({
        required this.idev,
        required this.fecha,
        required this.hora,
        required this.total,
        required this.comentario,
        required this.idcliente,
        required this.nomcliente,
    });

    int idev;
    String fecha;
    String hora;
    String total;
    String comentario;
    int idcliente;
    String nomcliente;

    factory EventosModel.fromJson(Map<String, dynamic> json) => EventosModel(
        idev: json["id_ev"],
        fecha: json["fecha_ev"],
        hora: json["hora_ev"],
        total: json["total_ev"],
        comentario: json["com_ev"],
        idcliente: json["id_cli"],
        nomcliente: json["nom_cli"],
    );

    Map<String, dynamic> toJson() => {
        "id_ev": idev,
        "fecha_ev": fecha,
        "hora_ev": hora,
        "total_ev": total,
        "com_ev": comentario,
        "id_cli": idcliente,
        "nom_cli": nomcliente,
    };
}
