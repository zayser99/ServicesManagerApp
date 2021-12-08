import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/presupuesto_model.dart';
import 'package:services_manager_app/models/presupuestoservicio_model.dart';
import 'package:services_manager_app/providers/cotizacion_provider.dart';
import 'package:services_manager_app/widgets/tarjeta_servicios_showpre.dart';

class ShowCotizacion extends StatefulWidget {
  final PresupuestoModel presupuesto;
  const ShowCotizacion({Key? key, required this.presupuesto}) : super(key: key);

  @override
  State<ShowCotizacion> createState() =>
      // ignore: no_logic_in_create_state
      _ShowCotizacionState(presupuesto: presupuesto);
}

class _ShowCotizacionState extends State<ShowCotizacion> {
  final PresupuestoModel presupuesto;
  _ShowCotizacionState({required this.presupuesto});
  @override
  Widget build(BuildContext context) {
    final presupuestosProvider = Provider.of<CotizacionProvider>(context);
    presupuestosProvider.cargarServiciosDelPre(presupuesto.id);
    final List<PresupuestoserviciosModel> servDelPre =
        presupuestosProvider.serviciosDelPresupuesto;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Cotización: #${presupuesto.id}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Cotización',
            onPressed: () {
              presupuestosProvider.limpiarVariables();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            _showName(),
            const Divider(height: 10),
            _showComentario(),
            const Divider(height: 10),
            _showTotal(presupuesto.total.toString()),
            const Divider(height: 20),
            _lisviewServicios(servDelPre),
            const Divider(height: 10),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.print,
        ),
        backgroundColor: Colors.indigo,
      ),
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

  Widget _showComentario() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Comentario:',
          style: TextStyle(fontSize: 20, color: Colors.indigo),
          overflow: TextOverflow.fade,
        ),
        Text(
          presupuesto.comentario,
          style: const TextStyle(fontSize: 15),
          overflow: TextOverflow.fade,
          textAlign: TextAlign.justify,
        )
      ],
    );
  }

  Widget _showName() {
    return Row(
      children: [
        const Icon(
          Icons.account_circle_outlined,
          color: Colors.indigo,
        ),
        const SizedBox(width: 5),
        Text(
          presupuesto.nomcliente,
          style: const TextStyle(fontSize: 18),
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
            return TarjetaServiciosShowPre(
              servicioDelpre: serviciosDelPresupuesto[index],
            );
          },
        ),
      ),
    );
  }
}
