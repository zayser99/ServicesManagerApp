import 'dart:convert';

EventosserviciosModel eventosserviciosModelFromJson(String str) => EventosserviciosModel.fromJson(json.decode(str));

String eventosserviciosModelToJson(EventosserviciosModel data) => json.encode(data.toJson());

class EventosserviciosModel {
    EventosserviciosModel({
        required this.id,
        required this.comentario,
        required this.ceserv,
        required this.idev,
        required this.idserv,
    });

    int id;
    String comentario;
    int ceserv;
    int idev;
    int idserv;

    factory EventosserviciosModel.fromJson(Map<String, dynamic> json) => EventosserviciosModel(
        id: json["id_evserv"],
        comentario: json["com_evserv"],
        ceserv: json["cant_evserv"],
        idev: json["id_ev"],
        idserv: json["id_serv"],
    );

    Map<String, dynamic> toJson() => {
        "id_evserv": id,
        "com_evserv": comentario,
        "cant_evserv": ceserv,
        "id_ev": idev,
        "id_serv": idserv,
    };
}