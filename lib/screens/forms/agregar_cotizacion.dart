import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/cliente_model.dart';
import 'package:services_manager_app/models/presupuesto_model.dart';
import 'package:services_manager_app/models/presupuestoservicio_model.dart';
import 'package:services_manager_app/providers/clientes_provider.dart';
import 'package:services_manager_app/providers/cotizacion_provider.dart';

import 'package:services_manager_app/search/search_delegate_for_coti.dart';
import 'package:services_manager_app/widgets/tarjeta_servicios_mini_pre.dart';

class AgregarCotizacion extends StatefulWidget {
  final int idPre;
  const AgregarCotizacion({Key? key, required this.idPre}) : super(key: key);

  @override
  State<AgregarCotizacion> createState() =>
      // ignore: no_logic_in_create_state
      _AgregarCotizacionState(idPre: idPre);
}

class _AgregarCotizacionState extends State<AgregarCotizacion> {
  int dropdownValue = 1;
  String _comentario = '';
  int idPre;
  _AgregarCotizacionState({required this.idPre});
  @override
  Widget build(BuildContext context) {
    final clientesProvider = Provider.of<ClientesProvider>(context);
    clientesProvider.cargarClientes();
    final List<ClienteModel> clientes = clientesProvider.clientes;
    final presupuestosProvider = Provider.of<CotizacionProvider>(context);
    presupuestosProvider.cargarServiciosDelPre(idPre);
    final List<PresupuestoserviciosModel> servDelPre =
        presupuestosProvider.serviciosDelPresupuesto;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Agregar Cotización'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'agregar Cotizacion',
            onPressed: () {
              presupuestosProvider.cargarTotalDelPresupuesto(idPre);
              String fecha = DateTime.now().toString();
              fecha = fecha.replaceRange(10, 26, '');
              final presupuesto = PresupuestoModel(
                comentario: _comentario,
                fecha: fecha,
                id: idPre,
                idcliente: dropdownValue,
                nomcliente: '',
                total: presupuestosProvider.totalDelPre,
              );
              presupuestosProvider.editarPresupuesto(presupuesto);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            _showID(idPre.toString()),
            const Divider(height: 10),
            _inputTipo(clientes),
            const Divider(height: 10),
            _inputCom(),
            const Divider(height: 10),
            _showTotal(presupuestosProvider.totalDelPre.toString()),
            const Divider(height: 20),
            _lisviewServicios(servDelPre),
            const Divider(height: 10),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          showSearch(
              context: context,
              delegate: CotizacionSearchDelegate(idPre: idPre));
        },
        child: const Icon(Icons.add),
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

  Widget _showTotal(total) {
    return Row(
      children: [
        const Text('TOTAL:',
            style: TextStyle(fontSize: 20, color: Colors.indigo)),
        const SizedBox(width: 20),
        Text(
          "\$" + total + " MNX",
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget _inputCom() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Comentario de la cotizacion',
        labelText: 'Comentario',
        icon: const Icon(Icons.list),
      ),
      onChanged: (valor) {
        _comentario = valor;
      },
    );
  }

  Widget _inputTipo(List<ClienteModel> clientes) {
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
          items: clientes.map((list) {
            return DropdownMenuItem(
              child: Text(list.nombre + " " + list.apellido),
              value: list.id,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _lisviewServicios(
      List<PresupuestoserviciosModel> serviciosDelPresupuesto) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: serviciosDelPresupuesto.length,
          itemBuilder: (BuildContext context, int index) {
            return TarjetaServiciosMiniPre(
                servicioDelpre: serviciosDelPresupuesto[index]);
          },
        ),
      ),
    );
  }
}
