import 'package:flutter/material.dart';

class ClientesScreen extends StatelessWidget {
  const ClientesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search_outlined), onPressed: () => {}
              //   showSearch(context: context, delegate: MovieSearchDelegate()),
              )
        ],
      ),
      body: Column(
        children: [
          _botonAddCliente(size.height * 0.10),
          _lisviewClientes(),
        ],
      ),
    );
  }
}

Widget _botonAddCliente(alto) {
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
                  'cliente',
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

Widget _lisviewClientes() {
  return Expanded(
    child: SizedBox(
      width: double.infinity,
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return _clienteItem();
        },
      ),
    ),
  );
}

Widget _clienteItem() {
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
                    Icons.account_circle_outlined,
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
          children: const [
            Text(
              'Juan Alejandro perez lopez',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '938-453-4345',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.indigo),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'correo-cliente@gmail.com',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
            Text(
              'Rfc:  ' + 'MELM8305281H0',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.indigo),
              overflow: TextOverflow.ellipsis,
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
