import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './model.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList({this.userTransactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: userTransactions.isNotEmpty
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                final Transaction transaction = userTransactions[index];
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '\$ ${transaction.amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transaction.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transaction.date),
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: userTransactions.length,
            )
          : Column(
              children: <Widget>[
                Text(
                  'No transactions found yet !',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
    );
  }
}