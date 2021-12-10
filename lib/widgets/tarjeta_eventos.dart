import 'package:flutter/material.dart';
import 'package:services_manager_app/models/eventos_model.dart';
import 'package:services_manager_app/providers/eventos_provider.dart';
import 'package:services_manager_app/screens/show_evento.dart';

class TarjetaEventos extends StatefulWidget {
  final EventosModel evento;
  const TarjetaEventos({Key? key, required this.evento}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<TarjetaEventos> createState() => _TarjetaEventosState(evento: evento);
}

/// This is the private State class that goes with MyStatefulWidget.
class _TarjetaEventosState extends State<TarjetaEventos> {
  final EventosModel evento;
  _TarjetaEventosState({required this.evento});

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
                Expanded(child: Text(evento.id.toString()), flex: 1),
                const Expanded(
                    child: Icon(
                      Icons.library_books_outlined,
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
                      '\$${evento.total}mnx',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Text(
                    'EVENTO',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.indigo),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Text(
                evento.nomcliente,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.indigo),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${evento.fecha} a las ${evento.hora}',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
              GestureDetector(
                onTap: () {
                  final route = MaterialPageRoute(builder: (context) {
                    return ShowEvento(evento: evento);
                  });
                  Navigator.push(context, route);
                },
                child: const Text(
                  'Detalles...',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.cyan),
                  overflow: TextOverflow.ellipsis,
                ),
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
                    '¿Seguro que desea Eliminar Este Evento',
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
                        eventoProvider.borrarEventoPorId(evento.id);
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
