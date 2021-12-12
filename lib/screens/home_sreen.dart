import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/citas_model.dart';
import 'package:services_manager_app/providers/estadisticas_provider.dart';
import 'package:services_manager_app/providers/peindientes_provider.dart';
import 'package:services_manager_app/screens/pendientes_screen.dart';
import 'package:services_manager_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool bandera = true;
  @override
  Widget build(BuildContext context) {
    final pendientesProvider = Provider.of<PendinetesProvider>(context);
    final estadisticasProvider = Provider.of<EstadisticasProvider>(context);
    final List<CitasModel> pendientes = pendientesProvider.pendientes;
    if (bandera) {
      pendientesProvider.cargarPendientes();
      ///////////////////////////////
      estadisticasProvider.cargarTotalClientes();
      estadisticasProvider.cargarTotalDeServicios();
      estadisticasProvider.cargarTotalGanancias();
      estadisticasProvider.cargarTotalpendientes();
      bandera = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
              onPressed: () {
                pendientesProvider.cargarPendientes();
                ///////////////////////////////
                estadisticasProvider.cargarTotalClientes();
                estadisticasProvider.cargarTotalDeServicios();
                estadisticasProvider.cargarTotalGanancias();
                estadisticasProvider.cargarTotalpendientes();
              },
              icon: const Icon(Icons.update_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tarjetas de this week
            ThisWeek(
              clientes: estadisticasProvider.clientes,
              ganancias: estadisticasProvider.ganancias,
              pendinetes: estadisticasProvider.pendinetes,
              servicios: estadisticasProvider.servicios,
            ),
            //chebox list
            GestureDetector(
              onTap: () {
                pendientesProvider.cargarPendientes();
                final route = MaterialPageRoute(builder: (context) {
                  return PendientesScreen(pendientes: pendientes);
                });
                Navigator.push(context, route);
              },
              child: Pendientes(pendientes: pendientes),
            ),
            //tarjetas grandes
            const Gestionar(),
          ],
        ),
      ),
    );
  }
}
