import 'package:flutter/material.dart';
import 'package:services_manager_app/models/citas_model.dart';

class Pendientes extends StatelessWidget {
  final List<CitasModel> pendientes;
  const Pendientes({Key? key, required this.pendientes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, left: 5),
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: const Text('Pendientes del dia de hoy',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Container(
          width: double.infinity,
          height: size.height * 0.22,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                blurRadius: 5,
                spreadRadius: -1,
                offset: Offset(0, 0),
              ),
            ],
          ),
          //cambiar por lisview builder
          child: ListView.builder(
            itemCount: pendientes.length,
            itemBuilder: (BuildContext context, int index) {
              return pendiente(
                  pendientes[index].status, pendientes[index].nomcliente);
            },
          ),
        ),
      ],
    );
  }

  Widget pendiente(String activado, String titulo) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5, top: 6, left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          iconActivado(activado),
          const SizedBox(width: 4),
          Text(titulo),
        ],
      ),
    );
  }

  Widget iconActivado(String activado) {
    if (activado != 'ATENDIDO') {
      return const Icon(Icons.circle_outlined, color: Colors.indigo);
    } else {
      return const Icon(Icons.check_circle, color: Colors.indigo);
    }
  }
}
