import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  final String? title;
  final String? toImage;

  const BigCard({Key? key, this.title, required this.toImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return contenedor();
  }

  Widget contenedor() {
    return Container(
      padding: const EdgeInsets.all(6),
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/icons/$toImage'),
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 13),
          Text('$title',
              textAlign: TextAlign.start,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
