import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:services_manager_app/models/citas_model.dart';
import 'package:services_manager_app/providers/citas_provider.dart';
import 'package:services_manager_app/widgets/widgets.dart';

class CitasScreen extends StatelessWidget {
  const CitasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final citasProvider = Provider.of<CitasProvider>(context);
    citasProvider.cargarCitas();
    final List<CitasModel> citas = citasProvider.citas;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Citas'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search_outlined), onPressed: () => {}
              //   showSearch(context: context, delegate: MovieSearchDelegate()),
              )
        ],
      ),
      body: Column(
        children: [
          _botonAddCita(size.height * 0.10, context),
          _lisviewCita(citas),
        ],
      ),
    );
  }
}

Widget _botonAddCita(alto, context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'AgregarCita');
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
                  'Cita',
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

Widget _lisviewCita(List<CitasModel> citas) {
  return Expanded(
    child: SizedBox(
      width: double.infinity,
      child: ListView.builder(
        itemCount: citas.length,
        itemBuilder: (_, int index) {
          return TarjetaCitas(
            cita: citas[index],
          );
        },
      ),
    ),
  );
}
