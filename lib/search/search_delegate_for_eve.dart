import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/servicios_model.dart';
import 'package:services_manager_app/providers/eventos_provider.dart';

class EventoSearchDelegate extends SearchDelegate {
  int idEve;
  EventoSearchDelegate({required this.idEve});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.cleaning_services_rounded),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }
    final eventosProvider =
        Provider.of<EventosProvider>(context, listen: false);
    return FutureBuilder(
      future: eventosProvider.cargarServiciosEncontrados(query),
      builder: (_, AsyncSnapshot<List<ServiciosModel>> snapshot) {
        if (!snapshot.hasData) {
          return _emptyContainer();
        }
        final servicios = snapshot.data;

        return ListView.builder(
          itemCount: servicios!.length,
          itemBuilder: (
            _,
            int index,
          ) {
            return _ServicioItem(servicio: servicios[index], idEve: idEve);
          },
        );
      },
    );
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.build_rounded,
        color: Colors.black38,
        size: 100,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }
    final eventosProvider =
        Provider.of<EventosProvider>(context, listen: false);
    return FutureBuilder(
      future: eventosProvider.cargarServiciosEncontrados(query),
      builder: (_, AsyncSnapshot<List<ServiciosModel>> snapshot) {
        if (!snapshot.hasData) {
          return _emptyContainer();
        }
        final servicios = snapshot.data;

        return ListView.builder(
          itemCount: servicios!.length,
          itemBuilder: (
            _,
            int index,
          ) {
            return _ServicioItem(servicio: servicios[index], idEve: idEve);
          },
        );
      },
    );
  }
}

class _ServicioItem extends StatelessWidget {
  final ServiciosModel servicio;
  final int idEve;
  const _ServicioItem({required this.servicio, required this.idEve});

  @override
  Widget build(BuildContext context) {
    final eventoProvider = Provider.of<EventosProvider>(context);
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 70,
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
              children: const [
                Expanded(
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
                servicio.nombre,
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'P/U: \$ ${servicio.precio} mnx',
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black45),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                icon: const Icon(
                  Icons.add_box_rounded,
                  color: Colors.greenAccent,
                ),
                onPressed: () {
                  eventoProvider.nuevoServicioDelEve(idEve, servicio.id);
                  eventoProvider.cargarTotalDelEvento(idEve);
                  showDialog(
                    context: context,
                    builder: (contex) {
                      return AlertDialog(
                        title: const Text(
                          'AGREGADO',
                          style: TextStyle(color: Colors.green),
                        ),
                        content: Text(
                          'se agrego:" ${servicio.nombre}"',
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK',
                                style: TextStyle(color: Colors.green)),
                          ),
                        ],
                      );
                    },
                  );
                },
              )),
        ],
      ),
    );
  }
}
