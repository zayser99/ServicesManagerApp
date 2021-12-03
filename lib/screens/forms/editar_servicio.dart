import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/servicios_model.dart';
import 'package:services_manager_app/models/tiposserv_model.dart';
import 'package:services_manager_app/providers/servicios_provider.dart';

class EditarServicio extends StatefulWidget {
  final ServiciosModel servicio;
  const EditarServicio({Key? key, required this.servicio}) : super(key: key);

  @override
  State<EditarServicio> createState() =>
      _EditarServicioState(servicio: servicio);
}

class _EditarServicioState extends State<EditarServicio> {
  final ServiciosModel servicio;
  _EditarServicioState({required this.servicio});
  String _nombre = '';
  double _precio = 0.0;
  String _desc = '';
  @override
  Widget build(BuildContext context) {
    _nombre = servicio.nombre;
    _precio = servicio.precio;
    _desc = servicio.descripcion;
    final tipoServicioProvider = Provider.of<ServiciosProvider>(context);
    tipoServicioProvider.cargarTiposServicios();
    final List<TiposservModel> tipoServicios =
        tipoServicioProvider.tipoServicios;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Editar Servicio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'agregar Servicio',
            onPressed: () {
              servicio.nombre = _nombre;
              servicio.precio = _precio;
              servicio.descripcion = _desc;
              final servicioProvider = ServiciosProvider();
              servicioProvider.editarServicio(servicio);

              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _showID('${servicio.id}'),
          const Divider(height: 60),
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

  Widget _showID(id) {
    return Row(
      children: [
        const Text('ID:', style: TextStyle(fontSize: 15)),
        const SizedBox(width: 20),
        Text(
          id,
          style: const TextStyle(fontSize: 20, color: Colors.indigo),
        ),
      ],
    );
  }

  Widget _inputNombre() {
    return TextFormField(
      initialValue: servicio.nombre,
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
    return TextFormField(
      initialValue: servicio.precio.toString(),
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
    return TextFormField(
      initialValue: servicio.descripcion,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Descripción',
        labelText: 'Descripción',
        icon: const Icon(Icons.build_circle_outlined),
      ),
      onChanged: (valor) {
        _desc = valor;
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
          value: servicio.idts,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          onChanged: (int? newValue) {
            setState(() {
              servicio.idts = newValue!;
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
