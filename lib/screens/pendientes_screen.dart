import 'package:flutter/material.dart';
import 'package:services_manager_app/widgets/widgets.dart';

class PendientesScreen extends StatefulWidget {
  const PendientesScreen({Key? key}) : super(key: key);

  @override
  State<PendientesScreen> createState() => _PendientesScreenState();
}

class _PendientesScreenState extends State<PendientesScreen> {
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
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const TarjetaPendientes();
          },
        ),
      ),
    );
  }
}
