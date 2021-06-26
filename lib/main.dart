import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer choosen');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'question': 'What\s your fav. color ?',
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'question': 'What\s your fav. animal ?',
        'answers': ['Cat', 'Dog', 'Tiger', 'Leopard']
      },
      {
        'question': 'Who is your fav. ding Dong ?',
        'answers': ['LOL', 'lol', 'LMAO', 'HAHAHHAHAHHA']
      },
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First app'),
      ),
      body: Column(
        children: <Widget>[
          Question(questions[_questionIndex]['question']),
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ],
      ),
    ));
  }
}

void main() {
  runApp(MyApp());
}
