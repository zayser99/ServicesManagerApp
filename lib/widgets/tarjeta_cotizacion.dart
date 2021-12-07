import 'package:flutter/material.dart';
import 'package:services_manager_app/models/presupuesto_model.dart';
import 'package:services_manager_app/providers/cotizacion_provider.dart';

class TarjetaCotizacion extends StatefulWidget {
  final PresupuestoModel presupuesto;
  const TarjetaCotizacion({Key? key, required this.presupuesto})
      : super(key: key);

  @override
  State<TarjetaCotizacion> createState() =>
      // ignore: no_logic_in_create_state
      _TarjetaCotizacionState(presupuesto: presupuesto);
}

class _TarjetaCotizacionState extends State<TarjetaCotizacion> {
  final PresupuestoModel presupuesto;
  _TarjetaCotizacionState({required this.presupuesto});
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
                Expanded(child: Text(presupuesto.id.toString()), flex: 1),
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
                      '\$${presupuesto.total}mnx',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Text(
                    'cotización...',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.cyan),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Text(
                presupuesto.nomcliente,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.indigo),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                presupuesto.comentario,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
              Text(
                presupuesto.fecha,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.indigo),
                overflow: TextOverflow.ellipsis,
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
                  content: const Text(
                    '¿Seguro que desea Eliminar Esta Cotización',
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
                        final cotizacionProvider = CotizacionProvider();
                        cotizacionProvider
                            .borrarPresupuestoPorId(presupuesto.id);
                        Navigator.pop(context, 'OK');
                      },
                      child:
                          const Text('OK', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                );
              });
        }
      },
    );
  }
}
