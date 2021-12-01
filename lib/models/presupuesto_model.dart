import 'dart:convert';

PresupuestoModel presupuestoModelFromJson(String str) => PresupuestoModel.fromJson(json.decode(str));

String presupuestoModelToJson(PresupuestoModel data) => json.encode(data.toJson());

class PresupuestoModel {
    PresupuestoModel({
        required this.idpre,
        required this.fecha,
        required this.total,
        required this.comentario,
        required this.idcliente,
        required this.nomcliente,
    });

    int idpre;
    String fecha;
    String total;
    String comentario;
    int idcliente;
    String nomcliente;

    factory PresupuestoModel.fromJson(Map<String, dynamic> json) => PresupuestoModel(
        idpre: json["id_pre"],
        fecha: json["fecha_pre"],
        total: json["total_pre"],
        comentario: json["com_pre"],
        idcliente: json["id_cli"],
        nomcliente: json["nom_cli"],
    );

    Map<String, dynamic> toJson() => {
        "id_pre": idpre,
        "fecha_pre": fecha,
        "total_pre": total,
        "com_pre": comentario,
        "id_cli": idcliente,
        "nom_cli": nomcliente,
    };
}
