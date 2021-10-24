import 'package:flutter/material.dart';

class TarjetaEventos extends StatefulWidget {
  const TarjetaEventos({Key? key}) : super(key: key);

  @override
  State<TarjetaEventos> createState() => _TarjetaEventosState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TarjetaEventosState extends State<TarjetaEventos> {
  @override
  Widget build(BuildContext context) {
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
                      Icons.library_books_outlined,
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
                      '\$500mnx',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'Evento',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.indigo),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const Text(
                'Juan Alejandro perez lopez',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.indigo),
                overflow: TextOverflow.ellipsis,
              ),
              const Text(
                '30 de ocubre 2021 a las 12pm',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
              const Text(
                'Detalles...',
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
              child: _desplegableBorEdit()),
        ],
      ),
    );
  }

  Widget _desplegableBorEdit() {
    return PopupMenuButton(
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
                onTap: () {},
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
                onTap: () {},
              )
            ]);
  }
}
