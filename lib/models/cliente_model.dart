import 'dart:convert';

ClienteModel clienteModelFromJson(String str) =>
    ClienteModel.fromJson(json.decode(str));

String clienteModelToJson(ClienteModel data) => json.encode(data.toJson());

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
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        numero: json["numero"],
        mail: json["mail"],
        rfc: json["rfc"],
      );

  Map<String, dynamic> toJson() => {
        "id_cli": id,
        "nom_cli": nombre,
        "ape_cli": apellido,
        "num_cli": numero,
        "mail_cli": mail,
        "rfc_cli": rfc,
      };
}
