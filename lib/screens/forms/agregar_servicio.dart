import 'package:flutter/material.dart';

class AgregarServicio extends StatelessWidget {
  const AgregarServicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Servicio'),
        //  automaticallyImplyLeading: false,
      ),
      body: const Text('servicios'),
    );
  }
}
