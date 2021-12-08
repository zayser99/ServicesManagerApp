// To parse this JSON data, do
//
//     final presupuestoserviciosModel = presupuestoserviciosModelFromJson(jsonString);

import 'dart:convert';

PresupuestoserviciosModel presupuestoserviciosModelFromJson(String str) =>
    PresupuestoserviciosModel.fromJson(json.decode(str));

String presupuestoserviciosModelToJson(PresupuestoserviciosModel data) =>
    json.encode(data.toJsonForInsert());

class PresupuestoserviciosModel {
  PresupuestoserviciosModel(
      {required this.id,
      required this.cantidad,
      required this.idp,
      required this.idserv,
      required this.nomserv,
      required this.precioU});

  int id;
  int cantidad;
  int idp;
  int idserv;
  String nomserv;
  double precioU;

  factory PresupuestoserviciosModel.fromJson(Map<String, dynamic> json) =>
      PresupuestoserviciosModel(
        id: json["id_preserv"],
        cantidad: json["cant_preserv"],
        idp: json["id_pre"],
        idserv: json["id_serv"],
        nomserv: json["nom_serv"],
        precioU: json["prec_serv"],
      );

  Map<String, dynamic> toJsonForInsert() => {
        "id_preserv": null,
        "com_preserv": "ninguno",
        "cant_preserv": cantidad,
        "id_pre": idp,
        "id_serv": idserv,
      };

  Map<String, dynamic> toJson() => {
        "id_preserv": id,
        "com_preserv": "ninguno",
        "cant_preserv": cantidad,
        "id_pre": idp,
        "id_serv": idserv,
      };
}
