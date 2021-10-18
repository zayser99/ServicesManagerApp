import 'package:flutter/material.dart';

class CitasScreen extends StatelessWidget {
  const CitasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          _botonAddCita(size.height * 0.10),
          _lisviewCita(),
        ],
      ),
    );
  }
}

Widget _botonAddCita(alto) {
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
        ),
      ));
}

Widget _lisviewCita() {
  return Expanded(
    child: SizedBox(
      width: double.infinity,
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return _citaItem();
        },
      ),
    ),
  );
}

Widget _citaItem() {
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
                    Icons.design_services_rounded,
                    color: Colors.indigo,
                  ),
                  flex: 4),
            ],
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // ignore: unnecessary_const
              children: const [
                Expanded(
                  child: Text(
                    '5 de ocubre 2021 a las 12pm',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'Atrasado',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.orange),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Text(
              'Sergio Manuel Zaldivar Yerbes',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.indigo),
              overflow: TextOverflow.ellipsis,
            ),
            const Text(
              'calle 26, #40, Col. 30 de julio (esquina con 8 de marzo)',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 12),
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'LLAMAR',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.lightBlue),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Cotización...',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.indigo),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
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
