import 'dart:convert';

PresupuestoModel presupuestoModelFromJson(String str) =>
    PresupuestoModel.fromJson(json.decode(str));

String presupuestoModelToJson(PresupuestoModel data) =>
    json.encode(data.toJson());

class PresupuestoModel {
  PresupuestoModel({
    required this.id,
    required this.fecha,
    required this.total,
    required this.comentario,
    required this.idcliente,
    required this.nomcliente,
  });

  int id;
  String fecha;
  double total;
  String comentario;
  int idcliente;
  String nomcliente;

  factory PresupuestoModel.fromJson(Map<String, dynamic> json) =>
      PresupuestoModel(
        id: json["id_pre"],
        fecha: json["fecha_pre"],
        total: json["total_pre"],
        comentario: json["com__pre"],
        idcliente: json["id_cli"],
        nomcliente: json["nom_cli"] + " " + json["ape_cli"],
      );

  Map<String, dynamic> toJsonforInsert() => {
        "id_pre": null,
        "fecha_pre": fecha,
        "total_pre": total,
        "com__pre": comentario,
        "id_cli": idcliente,
      };

  Map<String, dynamic> toJson() => {
        "id_pre": id,
        "fecha_pre": fecha,
        "total_pre": total,
        "com__pre": comentario,
        "id_cli": idcliente,
      };
}
