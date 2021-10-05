import 'package:flutter/material.dart';

class Pendientes extends StatelessWidget {
  const Pendientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
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
          listPendientes(),
          listPendientes(),
          listPendientes(),
          listPendientes(),
          listPendientes(),
          listPendientes(),
        ],
      ),
    );
  }
}

Widget listPendientes() {
  bool activado = false;
  return Row(
    children: [
      Checkbox(value: activado, onChanged: (activado) {}),
      const Text('Trabajo de plomeria'),
    ],
  );
}
