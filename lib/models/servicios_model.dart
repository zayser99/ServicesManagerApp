import 'dart:convert';

ServiciosModel serviciosModelFromJson(String str) =>
    ServiciosModel.fromJson(json.decode(str));

String serviciosModelToJson(ServiciosModel data) =>
    json.encode(data.toJsonToInsert());

class ServiciosModel {
  ServiciosModel({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.idts,
  });

  int id;
  String nombre;
  double precio;
  String descripcion;
  int idts;

  factory ServiciosModel.fromJson(Map<String, dynamic> json) => ServiciosModel(
        id: json["id_serv"],
        nombre: json["nom_serv"],
        precio: json["prec_serv"],
        descripcion: json["desc_serv"],
        idts: json["idts"],
      );

  Map<String, dynamic> toJsonToInsert() => {
        "id_serv": null,
        "nom_serv": nombre,
        "prec_serv": precio,
        "desc_serv": descripcion,
        "id_tserv": idts,
      };

  Map<String, dynamic> toJsonToEdit() => {
        "id_serv": id,
        "nom_serv": nombre,
        "prec_serv": precio,
        "desc_serv": descripcion,
        "id_tserv": idts,
      };
}
