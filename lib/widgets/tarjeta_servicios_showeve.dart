import 'package:flutter/material.dart';
import 'package:services_manager_app/models/eventosservicios_model.dart';

class TarjetaServiciosShowEve extends StatefulWidget {
  final EventosserviciosModel servicioDelEve;
  const TarjetaServiciosShowEve({Key? key, required this.servicioDelEve})
      : super(key: key);

  @override
  State<TarjetaServiciosShowEve> createState() =>
      // ignore: no_logic_in_create_state
      _TarjetaServiciosShowEveState(servicioDelEve: servicioDelEve);
}

class _TarjetaServiciosShowEveState extends State<TarjetaServiciosShowEve> {
  final EventosserviciosModel servicioDelEve;
  _TarjetaServiciosShowEveState({required this.servicioDelEve});
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
        ],
      ),
    );
  }
}
