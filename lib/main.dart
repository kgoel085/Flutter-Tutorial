import 'package:flutter/material.dart';
import 'package:flutter_basics/result.dart';
import './quiz.dart';
import './result.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'question': 'What\'s your fav. color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'question': 'What\'s your fav. animal ?',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Dog', 'score': 5},
        {'text': 'Tiger', 'score': 3},
        {'text': 'Leopard', 'score': 1}
      ]
    },
    {
      'question': 'Who is your fav. ding Dong ?',
      'answers': [
        {'text': 'LOL', 'score': 10},
        {'text': 'lol', 'score': 5},
        {'text': 'LMAO', 'score': 3},
        {'text': 'HAHAHHAHAHHA', 'score': 1}
      ]
    },
  ];

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      _totalScore += score;
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app'),
        ),
        body: _questionIndex <= _questions.length - 1
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                totalScore: _totalScore,
                resetQuiz: resetQuiz,
              ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
