// To parse this JSON data, do
//
//     final presupuestoserviciosModel = presupuestoserviciosModelFromJson(jsonString);

import 'dart:convert';

PresupuestoserviciosModel presupuestoserviciosModelFromJson(String str) => PresupuestoserviciosModel.fromJson(json.decode(str));

String presupuestoserviciosModelToJson(PresupuestoserviciosModel data) => json.encode(data.toJson());

class PresupuestoserviciosModel {
    PresupuestoserviciosModel({
        required this.id,
        required this.comentario,
        required this.cantidad,
        required this.idp,
        required this.idserv,
        required this.nomserv,
    });

    int id;
    String comentario;
    int cantidad;
    int idp;
    int idserv;
    String nomserv;

    factory PresupuestoserviciosModel.fromJson(Map<String, dynamic> json) => PresupuestoserviciosModel(
        id: json["id"],
        comentario: json["comentario"],
        cantidad: json["cantidad"],
        idp: json["idp"],
        idserv: json["idserv"],
        nomserv: json["nomserv"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "comentario": comentario,
        "cantidad": cantidad,
        "idp": idp,
        "idserv": idserv,
        "nomserv": nomserv,
    };
}
