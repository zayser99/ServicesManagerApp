import 'dart:convert';

ClienteModel clienteModelFromJson(String str) =>
    ClienteModel.fromJson(json.decode(str));

String clienteModelToJson(ClienteModel data) =>
    json.encode(data.toJsonToInsert());

class ClienteModel {
  ClienteModel({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.numero,
    required this.mail,
    required this.rfc,
  });

  int id;
  String nombre;
  String apellido;
  String numero;
  String mail;
  String rfc;

  factory ClienteModel.fromJson(Map<String, dynamic> json) => ClienteModel(
        id: json["id_cli"],
        nombre: json["nom_cli"],
        apellido: json["ape_cli"],
        numero: json["num_cli"],
        mail: json["mail_cli"],
        rfc: json["rfc_cli"],
      );

  Map<String, dynamic> toJsonToInsert() => {
        "id_cli": null,
        "nom_cli": nombre,
        "ape_cli": apellido,
        "num_cli": numero,
        "mail_cli": mail,
        "rfc_cli": rfc,
      };

  Map<String, dynamic> toJsonToEdit() => {
        "id_cli": id,
        "nom_cli": nombre,
        "ape_cli": apellido,
        "num_cli": numero,
        "mail_cli": mail,
        "rfc_cli": rfc,
      };
}
