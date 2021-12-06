import 'package:flutter/material.dart';
import 'package:services_manager_app/providers/db_provider.dart';

class CotizacionProvider extends ChangeNotifier {
  Future<List<ServiciosModel>> cargarServiciosEncontrados(
      String buscado) async {
    final serviciosBuscados = await DBProvider.db.getSerchServicios(buscado);
    return serviciosBuscados;
  }
}
