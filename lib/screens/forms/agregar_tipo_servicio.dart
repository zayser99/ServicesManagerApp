import 'package:flutter/material.dart';
import 'package:services_manager_app/providers/servicios_provider.dart';

class AgregarTipoServicio extends StatefulWidget {
  const AgregarTipoServicio({Key? key}) : super(key: key);

  @override
  State<AgregarTipoServicio> createState() => _AgregarTipoServicioState();
}

class _AgregarTipoServicioState extends State<AgregarTipoServicio> {
  String _nombre = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Agregar tipo de Servicio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'agregar tipo de Servicio',
            onPressed: () {
              final serviciosProvider = ServiciosProvider();
              serviciosProvider.nuevoTipoServicio(0, _nombre);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _inputNombre(),
          const Divider(height: 60),
        ],
      ),
    );
  }

  Widget _inputNombre() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'nombre del servicio',
        labelText: 'Nombre',
        helperText: 'Lo mas descriptivo posible.',
        icon: const Icon(Icons.build_circle_outlined),
      ),
      onChanged: (valor) {
        _nombre = valor;
      },
    );
  }
}
