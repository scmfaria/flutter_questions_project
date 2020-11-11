
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

main() => runApp(QuestionApp());

// no Flutter tudo é Widget
// agora essa minha classe se torna um Widget, pois esta herdando de StatelessWidget, que é um Widget
// Scaffold = dá estrutura à aplicação.
// no body dentro de Scaffold, ele nao aceita um array de Widgets, mas sim somente um unico. 
// Para que vc coloque varios elementos dentro do body, é necessario usar outro Widget, no caso do Column, por exemplo.
// O Column organiza o layout dentro da aplicação

// essa classe é Stateless, ou seja, ela nao tem estado, entao todas as variaveis dentro dela devem ser 'final'
// se eu tentar mudar o valor de uma variavel dentro de um componente Stateless (ex: incrementar uma variavel), eu estou violando o estado. 

class _QuestionAppState extends State<QuestionApp> {
  // essa classe vai gerar o estado
  var _answersSelected = 0;
  var _totalPoint = 0;

  void _answers(int point) {
    if(hasSelectedQuestion) {
      setState(() {
        _answersSelected++;
        _totalPoint += point;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _answersSelected = 0;
      _totalPoint = 0;
    });
  }

  // o Map aceita um tipo mais generico, por isso foi usado aqui 
  final List<Map<String, Object>> _questions = const [
    {
      'text': 'Qual é a cor do céu?',
      'answer': [
        {'text': 'azul', 'point': 10 },
        {'text': 'roxo', 'point': 8 },
        {'text': 'preto', 'point': 9 },
        {'text': 'rosa', 'point': 9 },
      ],
    },
    {
      'text': 'Qual é o melhor amigo do homem?',
      'answer': [
        {'text': 'cachorro', 'point': 10 },
        {'text': 'gato', 'point': 5 },
        {'text': 'passaro', 'point': 5 },
        {'text': 'borboleta', 'point': 3 },
      ],
    },
    {
      'text': 'Quem é o melhor professor de TI do mundo?',
      'answer': [
        {'text': 'Maria', 'point': 10 },
        {'text': 'Joao', 'point': 3 },
        {'text': 'Pedro', 'point': 9 },
        {'text': 'Ana', 'point': 8 },
      ],
    },
  ];

  bool get hasSelectedQuestion {
    return _answersSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold( 
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: hasSelectedQuestion ? 
          Quiz(answer: _answers, questions: _questions, selectedQuestion: _answersSelected) : 
          Result(_totalPoint, _restartQuiz)
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {

  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }

}