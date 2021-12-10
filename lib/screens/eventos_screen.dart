import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/eventos_model.dart';
import 'package:services_manager_app/providers/eventos_provider.dart';
import 'package:services_manager_app/screens/forms/agregar_evento.dart';
import 'package:services_manager_app/widgets/widgets.dart';

class EventosScreen extends StatelessWidget {
  const EventosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventoProvider = Provider.of<EventosProvider>(context);
    final List<EventosModel> eventos = eventoProvider.eventos;
    eventoProvider.cargarEventos();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search_outlined), onPressed: () => {}
              //   showSearch(context: context, delegate: MovieSearchDelegate()),
              )
        ],
      ),
      body: Column(
        children: [
          _botonAddEvento(
              size.height * 0.10, context, 'AgregarEvento', eventoProvider),
          _lisviewEvento(eventos),
        ],
      ),
    );
  }

  Widget _botonAddEvento(alto, context, ruta, eventoProvider) {
    return GestureDetector(
      onTap: () async {
        int id = await _agregarNuevoEvento(eventoProvider);
        final route = MaterialPageRoute(builder: (context) {
          return AgregarEvento(idEve: id);
        });
        Navigator.push(context, route);
      },
      child: SizedBox(
          width: double.infinity / 2,
          height: alto,
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.indigo[400],
              borderRadius: BorderRadius.circular(10.0),
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
              children: const [
                Expanded(
                  child: Text(
                    'Evento',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Icon(Icons.add, color: Colors.white),
              ],
            ),
          )),
    );
  }

  Widget _lisviewEvento(List<EventosModel> eventos) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: eventos.length,
          itemBuilder: (BuildContext context, int index) {
            return TarjetaEventos(
              evento: eventos[index],
            );
          },
        ),
      ),
    );
  }

  Future<int> _agregarNuevoEvento(EventosProvider eventosProvider) async {
    int idPre = await eventosProvider.nuevoEvento('', '', '', 1, 0);
    return idPre;
  }
}
