import 'package:flutter/material.dart';

class Pendientes extends StatelessWidget {
  const Pendientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return contenedorlista();
  }
}

Widget contenedorlista() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.only(top: 10, left: 5),
        margin: const EdgeInsets.only(left: 5, right: 5),
        child: const Text('Pendientes del dia',
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
        child: ListView(
          children: [
            pendiente(),
            pendiente(),
            pendiente(),
            pendiente(),
            pendiente(),
          ],
        ),
      ),
    ],
  );
}

Widget pendiente() {
  bool activado = false;
  return Row(
    children: [
      Checkbox(
        value: activado,
        onChanged: (valor) {
          activado = valor!;
        },
      ),
      const Text('Trabajo de plomeria'),
    ],
  );
}
