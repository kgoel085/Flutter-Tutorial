import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTextFields extends StatefulWidget {
  final void Function(String, double, DateTime) submitHandler;

  TransactionTextFields({this.submitHandler});

  @override
  _TransactionTextFieldsState createState() => _TransactionTextFieldsState();
}

class _TransactionTextFieldsState extends State<TransactionTextFields> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDateTime;

  void _submitData() {
    final eneteredTitle = _titleController.text;
    final eneteredAmount = (_amountController.text.length > 0)
        ? double.parse(_amountController.text)
        : 0;

    if (eneteredTitle.isEmpty ||
        eneteredAmount < 0 ||
        _selectedDateTime == null) return;

    widget.submitHandler(
      eneteredTitle,
      eneteredAmount,
      _selectedDateTime,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDateTime = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                // onChanged: (value) => titleInput = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitData(),
                // onChanged: (value) => amountInput = value,
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        (_selectedDateTime == null)
                            ? 'No date choosen'
                            : 'Picked date: ${DateFormat.yMd().format(_selectedDateTime)}',
                      ),
                    ),
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
      ),
    );
  }
}
