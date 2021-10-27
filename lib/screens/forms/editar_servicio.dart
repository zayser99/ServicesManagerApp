import 'package:flutter/material.dart';

class EditarServicio extends StatelessWidget {
  const EditarServicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Servicio'),
        //  automaticallyImplyLeading: false,
      ),
      body: const Text('servicios'),
    );
  }
}
