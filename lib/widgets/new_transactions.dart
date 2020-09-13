import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactions;

  NewTransaction(this.addTransactions);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitEntry() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTransactions(
      titleController.text,
      double.parse(amountController.text),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Grund für Geldverlust'),
              controller: titleController,
              onSubmitted: (_) => submitEntry(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Betrag in €'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitEntry(),
            ),
            FlatButton(
              onPressed: submitEntry,
              child: Text('Hinzufügen'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
