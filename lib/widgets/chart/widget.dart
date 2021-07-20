import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/chart/bar.dart';
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
    }).reversed.toList();
  }

  double get maxSpending {
    return groupTransactionValues.fold(0.0, (sum, tx) {
      return sum + tx['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionValues);
    return Container(
      // height: MediaQuery.of(context).size.height * 0.3,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: data['day'],
                  spendingAmount: data['amount'],
                  spendingPctOfTotal: (maxSpending > 0)
                      ? (data['amount'] as double) / maxSpending
                      : 0.0,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
