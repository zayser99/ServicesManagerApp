import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/presupuesto_model.dart';
import 'package:services_manager_app/providers/cotizacion_provider.dart';
import 'package:services_manager_app/screens/forms/agregar_cotizacion.dart';

import 'package:services_manager_app/widgets/widgets.dart';

class CotizarScreen extends StatelessWidget {
  const CotizarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cotizacionProvider = Provider.of<CotizacionProvider>(context);
    final List<PresupuestoModel> presupuestos = cotizacionProvider.presupuestos;
    cotizacionProvider.cargarPresupuestos();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotizar'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search_outlined), onPressed: () => {}
              //   showSearch(context: context, delegate: MovieSearchDelegate()),
              )
        ],
      ),
      body: Column(
        children: [
          _botonAddCotizar(size.height * 0.10, context, 'AgregarCotizacion',
              cotizacionProvider),
          _lisviewCotizar(presupuestos),
        ],
      ),
    );
  }

  Widget _botonAddCotizar(alto, context, ruta, cotizacionProvider) {
    return GestureDetector(
      onTap: () async {
        int id = await _agregarNuevaCotizacion(cotizacionProvider);
        final route = MaterialPageRoute(builder: (context) {
          return AgregarCotizacion(idPre: id);
        });
        Navigator.push(context, route);
      },
      child: SizedBox(
          width: double.infinity / 2,
          height: alto,
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.indigo[400],
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
            child: Row(
              children: const [
                Expanded(
                  child: Text(
                    'Cotización',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Icon(Icons.add, color: Colors.white),
              ],
            ),
          )),
    );
  }

  Widget _lisviewCotizar(List<PresupuestoModel> presupuestos) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: presupuestos.length,
          itemBuilder: (_, int index) {
            return TarjetaCotizacion(
              presupuesto: presupuestos[index],
            );
          },
        ),
      ),
    );
  }

  Future<int> _agregarNuevaCotizacion(
      CotizacionProvider cotizacionProvider) async {
    int idPre = await cotizacionProvider.nuevoPresupuesto('', '', 1, 0);
    print(idPre.toString());
    return idPre;
  }
}
