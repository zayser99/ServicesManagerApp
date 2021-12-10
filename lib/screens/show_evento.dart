import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/eventos_model.dart';
import 'package:services_manager_app/models/eventosservicios_model.dart';
import 'package:services_manager_app/providers/eventos_provider.dart';
import 'package:services_manager_app/widgets/tarjeta_servicios_showeve.dart';

class ShowEvento extends StatefulWidget {
  final EventosModel evento;
  const ShowEvento({Key? key, required this.evento}) : super(key: key);

  @override
  State<ShowEvento> createState() =>
      // ignore: no_logic_in_create_state
      _ShowEventoState(evento: evento);
}

class _ShowEventoState extends State<ShowEvento> {
  final EventosModel evento;
  _ShowEventoState({required this.evento});
  @override
  Widget build(BuildContext context) {
    final eventoProvider = Provider.of<EventosProvider>(context);
    eventoProvider.cargarServiciosDelEve(evento.id);
    final List<EventosserviciosModel> servDelEve =
        eventoProvider.serviciosDelEvento;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Evento: #${evento.id}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Cotización',
            onPressed: () {
              eventoProvider.limpiarVariables();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            _showName(),
            const Divider(height: 10),
            _showComentario(),
            const Divider(height: 10),
            _showTotal(evento.total.toString()),
            const Divider(height: 20),
            _lisviewServicios(servDelEve),
            const Divider(height: 10),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.print,
        ),
        backgroundColor: Colors.indigo,
      ),
    );
  }

  Widget _showTotal(total) {
    return Row(
      children: [
        const Text('TOTAL:',
            style: TextStyle(fontSize: 20, color: Colors.indigo)),
        const SizedBox(width: 20),
        Text(
          "\$" + total + " MNX",
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget _showComentario() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Comentario:',
          style: TextStyle(fontSize: 20, color: Colors.indigo),
          overflow: TextOverflow.fade,
        ),
        Text(
          evento.comentario,
          style: const TextStyle(fontSize: 15),
          overflow: TextOverflow.fade,
          textAlign: TextAlign.justify,
        )
      ],
    );
  }

  Widget _showName() {
    return Row(
      children: [
        const Icon(
          Icons.account_circle_outlined,
          color: Colors.indigo,
        ),
        const SizedBox(width: 5),
        Text(
          evento.nomcliente,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _lisviewServicios(List<EventosserviciosModel> serviciosDelEvento) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: serviciosDelEvento.length,
          itemBuilder: (BuildContext context, int index) {
            return TarjetaServiciosShowEve(
              servicioDelEve: serviciosDelEvento[index],
            );
          },
        ),
      ),
    );
  }
}
