import 'package:flutter/material.dart';
import 'package:services_manager_app/widgets/widgets.dart';

class Gestionar extends StatelessWidget {
  const Gestionar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          height: MediaQuery.of(context).size.height - 440,
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
                toImage: 'assets/big_icon/cotizar.png',
              ),
              BigCard(
                title: 'Agendar cita',
                toImage: 'assets/big_icon/citas.png',
              ),
              BigCard(
                title: 'Eventos',
                toImage: 'assets/big_icon/eventos.png',
              ),
              BigCard(
                title: 'Alta Clientes',
                toImage: 'assets/big_icon/clientes.png',
              ),
              BigCard(
                title: 'Alta Servicios',
                toImage: 'assets/big_icon/servicios.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
