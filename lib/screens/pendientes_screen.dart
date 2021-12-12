import 'package:flutter/material.dart';
import 'package:services_manager_app/models/citas_model.dart';
import 'package:services_manager_app/widgets/widgets.dart';

class PendientesScreen extends StatefulWidget {
  final List<CitasModel> pendientes;
  const PendientesScreen({Key? key, required this.pendientes})
      : super(key: key);

  @override
  State<PendientesScreen> createState() =>
      // ignore: no_logic_in_create_state
      _PendientesScreenState(pendientes: pendientes);
}

class _PendientesScreenState extends State<PendientesScreen> {
  List<CitasModel> pendientes;
  _PendientesScreenState({required this.pendientes});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendientes'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search_outlined), onPressed: () => {}
              //   showSearch(context: context, delegate: MovieSearchDelegate()),
              )
        ],
      ),
      body: Column(
        children: [
          _lisviewCita(),
        ],
      ),
    );
  }

  Widget _lisviewCita() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: pendientes.length,
          itemBuilder: (BuildContext context, int index) {
            return TarjetaPendientes(
              itemPendiente: pendientes[index],
            );
          },
        ),
      ),
    );
  }
}
