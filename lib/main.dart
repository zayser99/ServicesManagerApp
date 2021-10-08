import 'package:flutter/material.dart';
import 'package:services_manager_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
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
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.indigo,
        ),
      ),
    );
  }
}
