import 'package:flutter/material.dart';
import 'package:services_manager_app/models/eventosservicios_model.dart';
import 'package:services_manager_app/providers/eventos_provider.dart';

class TarjetaServiciosMiniEve extends StatefulWidget {
  final EventosserviciosModel servicioDelEve;
  const TarjetaServiciosMiniEve({Key? key, required this.servicioDelEve})
      : super(key: key);

  @override
  State<TarjetaServiciosMiniEve> createState() =>
      // ignore: no_logic_in_create_state
      _TarjetaServiciosMiniEveState(servicioDelEve: servicioDelEve);
}

class _TarjetaServiciosMiniEveState extends State<TarjetaServiciosMiniEve> {
  final EventosserviciosModel servicioDelEve;
  _TarjetaServiciosMiniEveState({required this.servicioDelEve});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 85,
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
                Expanded(
                    child: Text(servicioDelEve.idserv.toString()), flex: 1),
                const Expanded(
                    child: Icon(
                      Icons.build_rounded,
                      color: Colors.indigo,
                    ),
                    flex: 4),
              ],
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                servicioDelEve.nomserv,
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'P/U: \$ ${servicioDelEve.precioU} mnx',
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black45),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    'Subtotal: \$${servicioDelEve.precioU * servicioDelEve.cantidad}mnx',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.indigo),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: Text(
                      'Cantidad: ${servicioDelEve.cantidad}',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
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
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Eliminar',
                  style: TextStyle(color: Colors.red),
                ),
                content: Text(
                  '¿Seguro que desea Eliminar "${servicioDelEve.nomserv}" de tu lista?',
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
                      final eventoProvider = EventosProvider();
                      eventoProvider
                          .borrarServicioDelEvePorId(servicioDelEve.id);
                      Navigator.pop(context, 'OK');
                    },
                    child:
                        const Text('OK', style: TextStyle(color: Colors.red)),
                  ),
                ],
              );
            });
      },
      child: const Icon(Icons.delete, color: Colors.redAccent),
    );
  }
}
