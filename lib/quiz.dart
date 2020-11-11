import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final int selectedQuestion;
  final List<Map<String, Object>> questions;
  final void Function(int) answer;

  Quiz({
    this.selectedQuestion,
    this.answer,
    this.questions,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String, Object>> answers = hasSelectedQuestion ?  questions[selectedQuestion]['answer'] : null;

    return Column(
      children: [ // aqui sim ele permite colocar uma lista de Widgets 
        Question(questions[selectedQuestion]['text']), // primeiro passa a posição da lista e depois pega a partir da chave do Map 
        ...answers
          .map((resp) => Answer(resp['text'], () => answer(resp['point'])))
          .toList(), // aqui ele vai pegar os elementos dessa lista e jogar dentro da lista de children, dentro de Column
      ],
    );
  }
}