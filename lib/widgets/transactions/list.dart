import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './model.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final void Function(String) deleteTransaction;

  TransactionList({this.userTransactions, this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: userTransactions.isNotEmpty
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                final Transaction transaction = userTransactions[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                          child: Text(
                            '\$${transaction.amount.toStringAsFixed(0)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction.date),
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTransaction(transaction.id),
                    ),
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
