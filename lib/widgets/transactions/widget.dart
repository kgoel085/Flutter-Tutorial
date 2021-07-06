import 'package:flutter/material.dart';
import './model.dart';
import './list.dart';
import './text_fields.dart';

class TransactionWidget extends StatefulWidget {
  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: '1',
        amount: 69.99,
        date: DateTime.now(),
        title: 'First transaction'),
    Transaction(
        id: '2',
        amount: 62.99,
        date: DateTime.now(),
        title: 'Second transaction'),
    Transaction(
        id: '1',
        amount: 69.99,
        date: DateTime.now(),
        title: 'First transaction'),
    Transaction(
        id: '2',
        amount: 62.99,
        date: DateTime.now(),
        title: 'Second transaction'),
    Transaction(
        id: '1',
        amount: 69.99,
        date: DateTime.now(),
        title: 'First transaction'),
    Transaction(
        id: '2',
        amount: 62.99,
        date: DateTime.now(),
        title: 'Second transaction')
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final tx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.blueAccent,
            child: Text('Chart'),
            elevation: 5,
          ),
        ),
        TransactionTextFields(submitHandler: _addNewTransaction),
        TransactionList(userTransactions: _userTransactions),
      ],
    );
  }
}
