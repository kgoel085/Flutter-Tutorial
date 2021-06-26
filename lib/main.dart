import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
    // throw UnimplementedError();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion () {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print('Answer choosen');
    print(questionIndex);
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
            Text(questions[questionIndex]),
            ElevatedButton(
              child: Text('Answer 1'), 
              onPressed: answerQuestion,
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