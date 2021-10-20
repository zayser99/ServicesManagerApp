import 'package:flutter/material.dart';
import 'package:services_manager_app/widgets/widgets.dart';

class CotizarScreen extends StatelessWidget {
  const CotizarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          _botonAddCotizar(size.height * 0.10),
          _lisviewCotizar(),
        ],
      ),
    );
  }
}

Widget _botonAddCotizar(alto) {
  return SizedBox(
      width: double.infinity / 2,
      height: alto,
      child: Expanded(
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
        ),
      ));
}

Widget _lisviewCotizar() {
  return Expanded(
    child: SizedBox(
      width: double.infinity,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const TarjetaCotizacion();
        },
      ),
    ),
  );
}
