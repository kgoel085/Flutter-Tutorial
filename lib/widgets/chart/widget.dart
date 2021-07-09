import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_basics/widgets/transactions/model.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> recentTransactions;
  ChartWidget({this.recentTransactions});

  List<Map<String, Object>> get groupTransactionValues {
    int numberOfItems = 7;
    return List.generate(numberOfItems, (index) {
      print(index);
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        var transaction = recentTransactions[i];
        DateTime transDate = transaction.date;

        if (transDate.day == weekDay.day &&
            transDate.month == weekDay.month &&
            transDate.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }

      var returnMap = {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };

      print(returnMap);
      return returnMap;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupTransactionValues.map((data) {
          return Text('${data['day']} : ${data['amount'].toString()}');
        }).toList(),
      ),
    );
  }
}
