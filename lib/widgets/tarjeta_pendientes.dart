import 'package:flutter/material.dart';

class TarjetaPendientes extends StatefulWidget {
  const TarjetaPendientes({Key? key}) : super(key: key);

  @override
  State<TarjetaPendientes> createState() => _TarjetaPendientesState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TarjetaPendientesState extends State<TarjetaPendientes> {
  bool isChecked = false;

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
              const Text(
                '5 de ocubre 2021 a las 12pm',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                overflow: TextOverflow.ellipsis,
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
            child: Column(
              children: [
                const Expanded(
                  child: Icon(
                    Icons.arrow_drop_down_circle_sharp,
                    color: Colors.indigo,
                  ),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.indigo,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
