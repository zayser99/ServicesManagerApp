import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/servicios_model.dart';
import 'package:services_manager_app/providers/servicios_provider.dart';
import 'package:services_manager_app/widgets/widgets.dart';

class ServiciosScreen extends StatelessWidget {
  const ServiciosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviciosProvider = Provider.of<ServiciosProvider>(context);
    serviciosProvider.cargarServicios();
    final List<ServiciosModel> servicios = serviciosProvider.servicios;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search_outlined), onPressed: () => {}
              //   showSearch(context: context, delegate: MovieSearchDelegate()),
              )
        ],
      ),
      body: Column(
        children: [
          _botones(size.height * 0.10, context),
          _lisviewServicios(servicios),
        ],
      ),
    );
  }
}

Widget _botones(alto, context) {
  return SizedBox(
    width: double.infinity,
    height: alto,
    child: Row(
      children: [
        _botonAdd('Servicio', 'agregarServicio', context),
        _botonAdd('tipo de Servicio', 'agregarTipoServicio', context),
      ],
    ),
  );
}

Widget _botonAdd(titulo, ruta, context) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ruta);
      },
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
          children: [
            Expanded(
              child: Text(
                titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Icon(Icons.add, color: Colors.white),
          ],
        ),
      ),
    ),
  );
}

Widget _lisviewServicios(List<ServiciosModel> servicios) {
  return Expanded(
    child: SizedBox(
      width: double.infinity,
      child: ListView.builder(
        itemCount: servicios.length,
        itemBuilder: (_, int index) {
          return TarjetaServicios(
            servicio: servicios[index],
          );
        },
      ),
    ),
  );
}
