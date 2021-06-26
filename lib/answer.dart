import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHanlder;
  final String answerText;
  Answer(this.selectHanlder, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: ElevatedButton(
        style: ButtonStyle(
            // backgroundColor: MaterialStateProperty.all(Colors.blue),
            // foregroundColor: MaterialStateProperty.all(Colors.white)
            ),
        child: Text(answerText),
        onPressed: selectHanlder,
      ),
    );
  }
}
