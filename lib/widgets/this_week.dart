import 'package:flutter/material.dart';
import 'package:services_manager_app/widgets/widgets.dart';

class ThisWeek extends StatelessWidget {
  const ThisWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'estadisticasScreen');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 5),
            child: const Text('Esta Semana',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          SizedBox(
            height: size.height * 0.10,
            width: double.infinity,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              scrollDirection: Axis.horizontal,
              children: const [
                MiniCard(
                  title: 'Servicios   ',
                  toImage: 'assets/icons/servicios.png',
                  dato: '15',
                ),
                SizedBox(width: 20),
                MiniCard(
                  title: 'Ganancias',
                  toImage: 'assets/icons/ganancias.png',
                  dato: '34.4k',
                ),
                SizedBox(width: 20),
                MiniCard(
                  title: 'Pendientes   ',
                  toImage: 'assets/icons/pendientes.png',
                  dato: '8',
                ),
                SizedBox(width: 20),
                MiniCard(
                  title: 'clientes at.',
                  toImage: 'assets/icons/clientes1.png',
                  dato: '15',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
