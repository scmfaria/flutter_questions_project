
import 'package:flutter/material.dart';

class Question extends StatelessWidget {

  final String text;

  Question(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // largura: valor maximo do double
      margin: EdgeInsets.all(10), // margem para todos os lados sendo o mesmo valor
      child: Text(
        text,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// EdgeInsets.fromLTRB(left, top, right, bottom) -> margem para left, top, right, bottom