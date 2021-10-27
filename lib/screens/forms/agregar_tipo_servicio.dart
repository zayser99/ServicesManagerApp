import 'package:flutter/material.dart';

class AgregarTipoServicio extends StatelessWidget {
  const AgregarTipoServicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar tipo de Servicio'),
        //  automaticallyImplyLeading: false,
      ),
      body: const Text('tipo servicios'),
    );
  }
}
