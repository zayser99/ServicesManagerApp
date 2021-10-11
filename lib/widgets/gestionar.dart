import 'package:flutter/material.dart';
import 'package:services_manager_app/widgets/widgets.dart';

class Gestionar extends StatelessWidget {
  const Gestionar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, left: 5),
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: const Text('Gestionar',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        SizedBox(
          height: size.height * 0.43,
          width: double.infinity,
          child: GridView.count(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            scrollDirection: Axis.vertical,
            children: const [
              BigCard(
                title: 'Cotizar',
                ruta: 'cotizarScreen',
                toImage: 'assets/big_icon/cotizar.png',
              ),
              BigCard(
                title: 'Agendar cita',
                ruta: 'citasScreen',
                toImage: 'assets/big_icon/citas.png',
              ),
              BigCard(
                title: 'Eventos',
                ruta: 'eventosScreen',
                toImage: 'assets/big_icon/eventos.png',
              ),
              BigCard(
                title: 'Alta Clientes',
                ruta: 'clientesScreen',
                toImage: 'assets/big_icon/clientes.png',
              ),
              BigCard(
                title: 'Alta Servicios',
                ruta: 'serviciosScreen',
                toImage: 'assets/big_icon/servicios.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
