import 'package:flutter/material.dart';

class Pendientes extends StatelessWidget {
  const Pendientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return contenedorlista(context, '8 de octubre');
  }
}

Widget contenedorlista(context, String fecha) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'pendientesScreen');
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10, left: 5),
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: Text('Pendientes del dia de hoy, $fecha',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Container(
          width: double.infinity,
          height: 175,
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
          child: ListView(
            //cambiar esta lista por la consulta
            children: listaPendientes(),
          ),
        ),
      ],
    ),
  );
}

List<Widget> listaPendientes() {
  return [
    pendiente(true, 'cita con maria juarez'),
    pendiente(false, 'cita con juan escutia'),
    pendiente(false, 'cita con pablo lopez'),
    pendiente(true, 'cita con oscar suarez'),
    pendiente(false, 'cita con ana zavala'),
  ];
}

Widget pendiente(bool activado, String titulo) {
  return Row(
    children: [
      Checkbox(
        value: activado,
        onChanged: (valor) {
          activado = valor!;
        },
      ),
      Text(titulo),
    ],
  );
}
