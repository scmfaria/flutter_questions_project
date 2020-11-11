import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;
  final void Function() restartQuiz;

  Result(this.result, this.restartQuiz);

  String get phraseResult {
    if(result < 8) {
      return 'Parabéns!!';
    } else if(result < 12) {
      return 'Você é bom!!';
    } else if(result < 16) {
      return 'Impressionante!!';
    } else {
      return 'Nivel Jedi!!';
    }
  } 

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(phraseResult,
          style: TextStyle(
              fontSize: 28, 
              color: Colors.blue
            )
          ),
        ),
        FlatButton(
          onPressed: restartQuiz, 
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.pink,
        )
      ],
    );
  }
}