import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  final Function pressHandler;
  final String text;
  AdaptiveTextButton({this.pressHandler, this.text});

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
        ? CupertinoButton(
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: pressHandler)
        : TextButton(
            onPressed: pressHandler,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                Theme.of(context).primaryColor,
              ),
            ),
          );
  }
}
