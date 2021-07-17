import 'package:flutter/material.dart';

class TransactionTextFields extends StatefulWidget {
  final void Function(String, double) submitHandler;

  TransactionTextFields({this.submitHandler});

  @override
  _TransactionTextFieldsState createState() => _TransactionTextFieldsState();
}

class _TransactionTextFieldsState extends State<TransactionTextFields> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submitData() {
    final eneteredTitle = titleController.text;
    final eneteredAmount = (amountController.text.length > 0)
        ? double.parse(amountController.text)
        : 0;

    if (eneteredTitle.isEmpty || eneteredAmount < 0) return;

    widget.submitHandler(
      eneteredTitle,
      eneteredAmount,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) => amountInput = value,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('No date choosen'),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor,
                    )),
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).textTheme.button.color,
                ),
              ),
              onPressed: _submitData,
              child: Text('Add transactions'),
            )
          ],
        ),
      ),
    );
  }
}
