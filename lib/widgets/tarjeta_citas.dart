import 'package:flutter/material.dart';
import 'package:services_manager_app/models/citas_model.dart';
import 'package:services_manager_app/providers/citas_provider.dart';
import 'package:services_manager_app/screens/forms/editar_cita.dart';

class TarjetaCitas extends StatefulWidget {
  final CitasModel cita;
  const TarjetaCitas({Key? key, required this.cita}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<TarjetaCitas> createState() => _TarjetaCitasState(cita: cita);
}

class _TarjetaCitasState extends State<TarjetaCitas> {
  final CitasModel cita;
  _TarjetaCitasState({required this.cita});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
            spreadRadius: -1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                Expanded(child: Text(cita.id.toString()), flex: 1),
                const Expanded(
                    child: Icon(
                      Icons.design_services_rounded,
                      color: Colors.indigo,
                    ),
                    flex: 4),
              ],
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // ignore: unnecessary_const
                children: [
                  Expanded(
                    child: Text(
                      cita.fecha + " a las " + cita.hora,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    cita.status,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.orange),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Text(
                cita.nomcliente,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.indigo),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                cita.comentario,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 12),
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      'LLAMAR',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.lightBlue),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Cotización...',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.indigo),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          )),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: _desplegableBorEdit()),
        ],
      ),
    );
  }

  Widget _desplegableBorEdit() {
    return PopupMenuButton<String>(
      child: const Icon(
        Icons.arrow_drop_down_circle_sharp,
        color: Colors.indigo,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Row(
            children: const [
              Expanded(child: Text("Eliminar")),
              Icon(
                Icons.delete,
                color: Colors.indigo,
              ),
            ],
          ),
          value: 'eliminar',
        ),
        PopupMenuItem(
          child: Row(
            children: const [
              Expanded(child: Text("Editar")),
              Icon(
                Icons.edit,
                color: Colors.indigo,
              ),
            ],
          ),
          value: 'EditarCita',
        )
      ],
      onSelected: (route) {
        if (route == 'eliminar') {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.red),
                  ),
                  content: Text(
                    '¿Seguro que desea Eliminar esta cita con :${cita.nomcliente}?',
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.indigo),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        final citaProvider = CitasProvider();
                        citaProvider.borrarCitaPorId(cita.id);
                        Navigator.pop(context, 'OK');
                      },
                      child:
                          const Text('OK', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                );
              });
        } else {
          final route = MaterialPageRoute(builder: (context) {
            return EditarCita(
              cita: cita,
            );
          });
          Navigator.push(context, route);
        }
      },
    );
  }
}
