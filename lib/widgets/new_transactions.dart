import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactions;

  NewTransaction(this.addTransactions);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitEntry() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransactions(_titleController.text,
        double.parse(_amountController.text), _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2014),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
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
                decoration: InputDecoration(labelText: 'Grund für Geldverlust'),
                controller: _titleController,
                onSubmitted: (_) => _submitEntry(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Betrag in €'),
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitEntry(),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'Kein Datum gewählt!'
                        : 'Gewähltes Datum: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  Platform.isIOS
                      ? CupertinoButton(
                          child: Text(
                            'Wähle Datum',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: _presentDatePicker,
                        )
                      : FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          onPressed: _presentDatePicker,
                          child: Text(
                            'Wähle Datum',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                ],
              ),
              FlatButton(
                onPressed: _submitEntry,
                child: Text('Hinzufügen'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
