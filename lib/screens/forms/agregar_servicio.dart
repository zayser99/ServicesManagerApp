import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/tiposserv_model.dart';
import 'package:services_manager_app/providers/servicios_provider.dart';

class AgregarServicio extends StatefulWidget {
  const AgregarServicio({Key? key}) : super(key: key);

  @override
  State<AgregarServicio> createState() => _AgregarServicioState();
}

class _AgregarServicioState extends State<AgregarServicio> {
  int dropdownValue = 1;

  String _nombre = '';
  double _precio = 0.0;
  String _descripcion = '';
  @override
  Widget build(BuildContext context) {
    final tipoServicioProvider = Provider.of<ServiciosProvider>(context);
    tipoServicioProvider.cargarTiposServicios();
    final List<TiposservModel> tipoServicios =
        tipoServicioProvider.tipoServicios;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Agregar Servicio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'agregar Servicio',
            onPressed: () {
              final serviciosProvider = ServiciosProvider();
              serviciosProvider.nuevoServicio(
                0,
                _nombre,
                _descripcion,
                dropdownValue,
                _precio,
              );
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
          _inputTipo(tipoServicios),
          const Divider(height: 60),
          _inputPrecio(),
          const Divider(height: 60),
          _inputDesc(),
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

  Widget _inputPrecio() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Precio del servicio',
        labelText: 'Precio',
        icon: const Icon(Icons.monetization_on_outlined),
      ),
      onChanged: (valor) {
        if (valor != '') {
          _precio = double.parse(valor);
        }
      },
    );
  }

  Widget _inputDesc() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Descripción',
        labelText: 'Descripción',
        icon: const Icon(Icons.build_circle_outlined),
      ),
      onChanged: (valor) {
        _descripcion = valor;
      },
    );
  }

  Widget _inputTipo(List<TiposservModel> tipos) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(Icons.build_circle_outlined, color: Colors.grey),
        ),
        DropdownButton(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          onChanged: (int? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: tipos.map((list) {
            return DropdownMenuItem(
              child: Text(list.nombre),
              value: list.id,
            );
          }).toList(),
        ),
      ],
    );
  }
}
