import 'dart:convert';

EventosserviciosModel eventosserviciosModelFromJson(String str) =>
    EventosserviciosModel.fromJson(json.decode(str));

String eventosserviciosModelToJson(EventosserviciosModel data) =>
    json.encode(data.toJson());

class EventosserviciosModel {
  EventosserviciosModel(
      {required this.id,
      required this.cantidad,
      required this.idEv,
      required this.idserv,
      required this.nomserv,
      required this.precioU});

  int id;
  int cantidad;
  int idEv;
  int idserv;
  String nomserv;
  double precioU;

  factory EventosserviciosModel.fromJson(Map<String, dynamic> json) =>
      EventosserviciosModel(
        id: json["id_evserv"],
        cantidad: json["cant_evserv"],
        idEv: json["id_ev"],
        idserv: json["id_serv"],
        nomserv: json["nom_serv"],
        precioU: json["prec_serv"],
      );

  Map<String, dynamic> toJsonForInsert() => {
        "id_evserv": null,
        "com_preserv": "ninguno",
        "cant_evserv": cantidad,
        "id_ev": idEv,
        "id_serv": idserv,
      };

  Map<String, dynamic> toJson() => {
        "id_evserv": id,
        "com_preserv": "ninguno",
        "cant_evserv": cantidad,
        "id_ev": idEv,
        "id_serv": idserv,
      };
}
