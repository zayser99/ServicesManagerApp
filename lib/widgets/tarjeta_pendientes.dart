import 'package:flutter/material.dart';
import 'package:services_manager_app/models/citas_model.dart';
import 'package:services_manager_app/providers/peindientes_provider.dart';

class TarjetaPendientes extends StatefulWidget {
  final CitasModel itemPendiente;
  const TarjetaPendientes({Key? key, required this.itemPendiente})
      : super(key: key);

  @override
  State<TarjetaPendientes> createState() =>
      // ignore: no_logic_in_create_state
      _TarjetaPendientesState(itemPendiente: itemPendiente);
}

/// This is the private State class that goes with MyStatefulWidget.
class _TarjetaPendientesState extends State<TarjetaPendientes> {
  final CitasModel itemPendiente;
  bool isChecked = false;
  _TarjetaPendientesState({required this.itemPendiente});

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
                Expanded(child: Text('${itemPendiente.id}'), flex: 1),
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
              Text(
                '${itemPendiente.fecha} a las ${itemPendiente.hora}',
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                itemPendiente.nomcliente,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.indigo),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                itemPendiente.comentario,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 12),
              ),
              Row(
                children: [
                  Expanded(
                    child: status(itemPendiente.status),
                  ),
                ],
              ),
            ],
          )),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.indigo,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                      String status = 'PENDIENTE';
                      final pendientesProvider = PendinetesProvider();
                      if (value) {
                        status = 'ATENDIDO';
                      }

                      final pendiente = CitasModel(
                        id: itemPendiente.id,
                        fecha: itemPendiente.fecha,
                        hora: itemPendiente.hora,
                        comentario: itemPendiente.comentario,
                        status: status,
                        idcliente: itemPendiente.idcliente,
                        nomcliente: itemPendiente.nomcliente,
                        idpre: itemPendiente.idpre,
                      );
                      pendientesProvider.editarPendiente(pendiente);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget status(String status) {
    if (status != 'ATENDIDO') {
      return Text(
        status,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orange),
        overflow: TextOverflow.ellipsis,
      );
    } else {
      return Text(
        status,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),
        overflow: TextOverflow.ellipsis,
      );
    }
  }
}
