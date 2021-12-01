import 'dart:convert';

TiposservModel tiposservModelFromJson(String str) => TiposservModel.fromJson(json.decode(str));

String tiposservModelToJson(TiposservModel data) => json.encode(data.toJson());

class TiposservModel {
    TiposservModel({
        required this.idti,
        required this.nombre,
    });

    int idti;
    String nombre;

    factory TiposservModel.fromJson(Map<String, dynamic> json) => TiposservModel(
        idti: json["id_tserv"],
        nombre: json["nom_tserv"],
    );

    Map<String, dynamic> toJson() => {
        "id_tserv": idti,
        "nom_tserv": nombre,
    };
}