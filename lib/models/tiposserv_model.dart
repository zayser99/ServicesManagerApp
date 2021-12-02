import 'dart:convert';

TiposservModel tiposservModelFromJson(String str) =>
    TiposservModel.fromJson(json.decode(str));

String tiposservModelToJson(TiposservModel data) =>
    json.encode(data.toJsonForInsert());

class TiposservModel {
  TiposservModel({
    required this.id,
    required this.nombre,
  });

  int id;
  String nombre;

  factory TiposservModel.fromJson(Map<String, dynamic> json) => TiposservModel(
        id: json["id_tserv"],
        nombre: json["nom_tserv"],
      );

  Map<String, dynamic> toJsonForInsert() => {
        "id_tserv": null,
        "nom_tserv": nombre,
      };
  Map<String, dynamic> toJson() => {
        "id_tserv": id,
        "nom_tserv": nombre,
      };
}
