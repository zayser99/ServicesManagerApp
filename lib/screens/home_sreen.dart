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
    // final cliente = ClienteModel(
    //     id: 32,
    //     nombre: 'Maria Angela',
    //     apellido: 'SOlano Solano',
    //     numero: '9382002024',
    //     mail: 'solanomaria@gmail.com',
    //     rfc: '12w341543423');

    // DBProvider.db.nuevoCliente(cliente);
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
