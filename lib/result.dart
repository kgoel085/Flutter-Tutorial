import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;
  Result({this.totalScore, this.resetQuiz});

  String get resultPhrase {
    String resultText;
    if (totalScore <= 8) {
      resultText = 'You are awesome and innocent.';
    } else if (totalScore <= 15) {
      resultText = 'Pretty likeable';
    } else if (totalScore <= 20) {
      resultText = 'You are ... strange ?';
    } else {
      resultText = 'You are so bad !';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: resetQuiz,
            child: Text('Reset'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
          ),
        ],
      ),
    );
  }
}
