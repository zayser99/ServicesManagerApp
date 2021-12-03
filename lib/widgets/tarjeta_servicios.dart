// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/servicios_model.dart';
import 'package:services_manager_app/providers/db_provider.dart';
import 'package:services_manager_app/providers/servicios_provider.dart';
import 'package:services_manager_app/screens/forms/editar_servicio.dart';

class TarjetaServicios extends StatefulWidget {
  final ServiciosModel servicio;
  const TarjetaServicios({Key? key, required this.servicio}) : super(key: key);

  @override
  State<TarjetaServicios> createState() =>
      // ignore: no_logic_in_create_state
      _TarjetaServiciosState(servicio: servicio);
}

class _TarjetaServiciosState extends State<TarjetaServicios> {
  final ServiciosModel servicio;
  _TarjetaServiciosState({required this.servicio});
  @override
  Widget build(BuildContext context) {
    final serviciosProvider = Provider.of<ServiciosProvider>(context);
    serviciosProvider.cargarTiposServicios();
    final nombreTipoServicio =
        serviciosProvider.obtenerTipoServicioById(servicio.idts);
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
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
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                Expanded(child: Text(servicio.id.toString()), flex: 1),
                Expanded(
                    child: Icon(
                      Icons.build_rounded,
                      color: Colors.indigo,
                    ),
                    flex: 4),
              ],
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                servicio.nombre,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    '\$ ${servicio.precio}mnx',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.indigo),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: Text(
                      nombreTipoServicio,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Text(
                servicio.descripcion,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
              )),
            ],
          )),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: _desplegableBorEdit(context)),
        ],
      ),
    );
  }

  Widget _desplegableBorEdit(context) {
    return PopupMenuButton<String>(
      child: const Icon(
        Icons.arrow_drop_down_circle_sharp,
        color: Colors.indigo,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Row(
            children: const [
              Expanded(child: Text("Eliminar")),
              Icon(
                Icons.delete,
                color: Colors.indigo,
              ),
            ],
          ),
          value: 'eliminar',
        ),
        PopupMenuItem(
          child: Row(
            children: const [
              Expanded(child: Text("Editar")),
              Icon(
                Icons.edit,
                color: Colors.indigo,
              ),
            ],
          ),
          value: 'EditarServicio',
        )
      ],
      onSelected: (route) {
        if (route == 'eliminar') {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.red),
                  ),
                  content: Text(
                    '¿Seguro que desea Eliminar "${servicio.nombre}" de la lista de servicios?',
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancelar'),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.indigo),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        final servicioProvider = ServiciosProvider();
                        servicioProvider.borrarServicioPorId(servicio.id);
                        Navigator.pop(context, 'OK');
                      },
                      child:
                          const Text('OK', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                );
              });
        } else {
          final route = MaterialPageRoute(builder: (context) {
            return EditarServicio(servicio: servicio);
          });
          Navigator.push(context, route);
        }
      },
    );
  }
}
