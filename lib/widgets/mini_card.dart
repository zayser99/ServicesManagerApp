import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  final String? title;
  final String? dato;
  final String? toImage;

  const MiniCard({Key? key, this.title, this.dato, required this.toImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      width: 130,
      height: double.infinity,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '$dato',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text('$title',
                  textAlign: TextAlign.start, overflow: TextOverflow.ellipsis),
            ],
          ),
          Expanded(
            child: Image(
              image: AssetImage('$toImage'),
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }
}
