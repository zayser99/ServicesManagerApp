import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:services_manager_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // descativa la rotacion
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Service_manger_App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'eventosScreen': (_) => const EventosScreen(),
        'pendientesScreen': (_) => const PendientesScreen(),
        'citasScreen': (_) => const CitasScreen(),
        'clientesScreen': (_) => const ClientesScreen(),
        'cotizarScreen': (_) => const CotizarScreen(),
        'estadisticasScreen': (_) => const EstadisticasScreen(),
        'serviciosScreen': (_) => const ServiciosScreen(),
        //formularios
        'agregarServicio': (_) => const AgregarServicio(),
        'agregarTipoServicio': (_) => const AgregarTipoServicio(),
        'EditarServicio': (_) => const EditarServicio(),
        'AgregarCita': (_) => const AgregarCita(),
        'EditarCita': (_) => const EditarCita(),
        'AgregarCliente': (_) => const AgregarCliente(),
        'EditarCliente': (_) => const EditarCliente(),
        'AgregarCotizacion': (_) => const AgregarCotizacion(),
        'EditarCotizacion': (_) => const EditarCotizacion(),
        'AgregarEvento': (_) => const AgregarEvento(),
        'EditarEvento': (_) => const EditarEvento(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => const ServiciosScreen());
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo,
        ),
      ),
    );
  }
}
