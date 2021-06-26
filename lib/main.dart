import 'package:flutter/material.dart';
import './question.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion () {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer choosen');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\s your fav. color ?',
      'What\s your fav. animal ?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app'),
        ),
        body: Column(children: 
          <Widget>[
            Question(
              questions[_questionIndex]
            ),
            ElevatedButton(
              child: Text('Answer 1'), 
              onPressed: _answerQuestion,
            ),
            ElevatedButton(
              child: Text('Answer 2'),
              onPressed:  () {
                print('Answer 2 choosen');
              }
            ),
            ElevatedButton(
              child: Text('Answer 3'),
              onPressed:  () {
                print('Answer 3 choosen');
              }
            ),
            ElevatedButton(
              child: Text('Answer 4'),
              onPressed:  () {
                print('Answer 4 choosen');
              }
            ),
          ],
        ),
      )
    );
  }
}

void main () {
  runApp(MyApp());
}