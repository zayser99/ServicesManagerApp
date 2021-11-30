import 'package:flutter/material.dart';
import 'package:services_manager_app/providers/db_provider.dart';
import 'package:services_manager_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: TEMPORAL  leer la base de datos
    final cliente = ClienteModel(
        id: 30,
        nombre: 'jose',
        apellido: 'lopez',
        numero: '9382559558',
        mail: 'zai@hotmail.com',
        rfc: '123123123');

    DBProvider.db.nuevoCliente(cliente);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // Tarjetas de this week
            ThisWeek(),
            //chebox list
            Pendientes(),
            //tarjetas grandes
            Gestionar(),
          ],
        ),
      ),
    );
  }
}
