import 'package:flutter/material.dart';

class TarjetaServiciosMini extends StatefulWidget {
  const TarjetaServiciosMini({Key? key}) : super(key: key);

  @override
  State<TarjetaServiciosMini> createState() => _TarjetaServiciosMiniState();
}

class _TarjetaServiciosMiniState extends State<TarjetaServiciosMini> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 80,
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
              const Text(
                'P/U: \$5,000mnx',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black45),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: const [
                  Text(
                    'Subtotal: \$10,000mnx',
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
                      'Cantidad: 2',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
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
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Eliminar',
                  style: TextStyle(color: Colors.red),
                ),
                content: const Text(
                  '¿Seguro que desea Eliminar "Instalacion de rotoplas" de tu cotización?',
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child:
                        const Text('OK', style: TextStyle(color: Colors.red)),
                  ),
                ],
              );
            });
      },
      child: const Icon(Icons.delete, color: Colors.redAccent),
    );
  }
}
