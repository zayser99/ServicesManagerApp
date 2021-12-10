import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/cliente_model.dart';
import 'package:services_manager_app/models/eventos_model.dart';
import 'package:services_manager_app/models/eventosservicios_model.dart';
import 'package:services_manager_app/providers/clientes_provider.dart';
import 'package:services_manager_app/providers/eventos_provider.dart';
import 'package:services_manager_app/search/search_delegate_for_eve.dart';
import 'package:services_manager_app/widgets/tarjeta_servicios_mini_eve.dart';

class AgregarEvento extends StatefulWidget {
  final int idEve;
  const AgregarEvento({Key? key, required this.idEve}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<AgregarEvento> createState() => _AgregarEventoState(idEve: idEve);
}

class _AgregarEventoState extends State<AgregarEvento> {
  int dropdownValue = 1;
  String _comentario = '';
  int idEve;
  _AgregarEventoState({required this.idEve});
  @override
  Widget build(BuildContext context) {
    final clientesProvider = Provider.of<ClientesProvider>(context);
    clientesProvider.cargarClientes();
    final List<ClienteModel> clientes = clientesProvider.clientes;
    final eventoProvider = Provider.of<EventosProvider>(context);
    eventoProvider.cargarServiciosDelEve(idEve);
    final List<EventosserviciosModel> servDelEve =
        eventoProvider.serviciosDelEvento;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Agregar Evento'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'agregar Evento',
            onPressed: () {
              eventoProvider.cargarTotalDelEvento(idEve);
              String fecha = DateTime.now().toString();
              fecha = fecha.replaceRange(10, 26, '');
              String hora = DateTime.now().toString();
              hora = hora.replaceRange(0, 10, '');
              hora = hora.replaceRange(6, 16, '');

              final evento = EventosModel(
                comentario: _comentario,
                fecha: fecha,
                hora: hora,
                id: idEve,
                idcliente: dropdownValue,
                nomcliente: '',
                total: eventoProvider.totalDelEve,
              );
              eventoProvider.editarEvento(evento);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            _showID(idEve.toString()),
            const Divider(height: 10),
            _inputTipo(clientes),
            const Divider(height: 10),
            _inputCom(),
            const Divider(height: 10),
            _showTotal(eventoProvider.totalDelEve.toString()),
            const Divider(height: 20),
            _lisviewServicios(servDelEve),
            const Divider(height: 10),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          showSearch(
              context: context, delegate: EventoSearchDelegate(idEve: idEve));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _showID(id) {
    return Row(
      children: [
        const Text('ID:', style: TextStyle(fontSize: 15)),
        const SizedBox(width: 20),
        Text(
          id,
          style: const TextStyle(fontSize: 20, color: Colors.indigo),
        ),
      ],
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

  Widget _inputCom() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Comentario de la cotizacion',
        labelText: 'Comentario',
        icon: const Icon(Icons.list),
      ),
      onChanged: (valor) {
        _comentario = valor;
      },
    );
  }

  Widget _inputTipo(List<ClienteModel> clientes) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(Icons.build_circle_outlined, color: Colors.grey),
        ),
        DropdownButton(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          onChanged: (int? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: clientes.map((list) {
            return DropdownMenuItem(
              child: Text(list.nombre + " " + list.apellido),
              value: list.id,
            );
          }).toList(),
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
            return TarjetaServiciosMiniEve(
                servicioDelEve: serviciosDelEvento[index]);
          },
        ),
      ),
    );
  }
}
