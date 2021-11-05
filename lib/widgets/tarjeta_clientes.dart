import 'package:flutter/material.dart';

class TarjetaClientes extends StatefulWidget {
  const TarjetaClientes({Key? key}) : super(key: key);

  @override
  State<TarjetaClientes> createState() => _TarjetaClientesState();
}

class _TarjetaClientesState extends State<TarjetaClientes> {
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
                'Rfc:  MELM8305281H0',
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
          value: 'EditarCliente',
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
                  content: const Text(
                    '¿Seguro que desea Eliminar a "Juan Alejandro Perez Lopez"?',
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancelar'),
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
        } else {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}
