
import 'package:flutter/material.dart';

main() => runApp(QuestionApp());

// no Flutter tudo é Widget
// agora essa minha classe se torna um Widget, pois esta herdando de StatelessWidget, que é um Widget
// Scaffold = dá estrutura à aplicação.
// no body dentro de Scaffold, ele nao aceita um array de Widgets, mas sim somente um unico. 
// Para que vc coloque varios elementos dentro do body, é necessario usar outro Widget, no caso do Column, por exemplo.
// O Column organiza o layout dentro da aplicação

// essa classe é Stateless, ou seja, ela nao tem estado, entao todas as variaveis dentro dela devem ser 'final'
// se eu tentar mudar o valor de uma variavel dentro de um componente Stateless (ex: incrementar uma variavel), eu estou violando o estado. 

class QuestionAppState extends State<QuestionApp> {
  // essa classe vai gerar o estado
  var answersSelected = 0;

  void answers() {
    setState(() {
      answersSelected++;
    });
    print('Pergunta respondida');
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      'Qual é a sua cor favorita?',
      'Qual é seu animal favorito'
    ];

    return MaterialApp(
      home: Scaffold( 
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [ // aqui sim ele permite colocar uma lista de Widgets 
            Text(questions[answersSelected]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: answers,
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: answers,
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: answers,
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {

  @override
  QuestionAppState createState() {
    return QuestionAppState();
  }

}