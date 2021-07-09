import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_basics/widgets/transactions/model.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> recentTransactions;
  ChartWidget(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionValues {
    final numberOfItems = 7;
    return List.generate(numberOfItems, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0;
      for (var i = 0; i < numberOfItems; i++) {}

      return {
        'day': DateFormat.E(weekDay),
        'amount': 9.99,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
