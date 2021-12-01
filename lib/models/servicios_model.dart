import 'dart:convert';

ServiciosModel serviciosModelFromJson(String str) => ServiciosModel.fromJson(json.decode(str));

String serviciosModelToJson(ServiciosModel data) => json.encode(data.toJson());

class ServiciosModel {
    ServiciosModel({
        required this.id,
        required this.nombre,
        required this.precio,
        required this.descserv,
        required this.idts,
        required this.nombretserv,
    });

    int id;
    String nombre;
    String precio;
    String descserv;
    int idts;
    String nombretserv;

    factory ServiciosModel.fromJson(Map<String, dynamic> json) => ServiciosModel(
        id: json["id_serv"],
        nombre: json["nom_serv"],
        precio: json["prec_serv"],
        descserv: json["desc_serv"],
        idts: json["idts"],
        nombretserv: json["nom_tserv"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "precio": precio,
        "desc_serv": descserv,
        "id.tserv": idts,
        "nom_tserv": nombretserv,
    };
}
