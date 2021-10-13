import 'package:flutter/material.dart';

class ServiciosScreen extends StatelessWidget {
  const ServiciosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios'),
      ),
      body: Column(
        children: [
          botones(size.height * 0.10),
          lisviewServicios(),
        ],
      ),
    );
  }
}

Widget botones(alto) {
  return SizedBox(
    width: double.infinity,
    height: alto,
    child: Row(
      children: [
        botonAdd('Servicio'),
        botonAdd('tipo de Servicio'),
      ],
    ),
  );
}

Widget botonAdd(titulo) {
  return Expanded(
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
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Icon(Icons.add, color: Colors.white),
        ],
      ),
    ),
  );
}

Widget lisviewServicios() {
  return Expanded(
    child: SizedBox(
      width: double.infinity,
      child: ListView(
        children: listaServicios(),
      ),
    ),
  );
}

List<Widget> listaServicios() {
  return [
    servicioItem(),
    servicioItem(),
    servicioItem(),
    servicioItem(),
    servicioItem(),
    servicioItem(),
    servicioItem(),
    servicioItem(),
    servicioItem(),
    servicioItem(),
    servicioItem(),
    servicioItem(),
  ];
}

Widget servicioItem() {
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
            children: const [
              Expanded(child: Text('1'), flex: 1),
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
            const Text(
              'Intalacion de Rotoplas',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: const [
                Text(
                  '\$5,000mnx',
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
                    'fontaneria',
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
            const Expanded(
                child: Text(
              'consta de intalar el rotopas y las tuberias necesarias para el correcto funcionamiento del mismo',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.justify,
            )),
          ],
        )),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: const Icon(
            Icons.arrow_drop_down_circle_sharp,
            color: Colors.indigo,
          ),
        ),
      ],
    ),
  );
}
