import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransactions;

  NewTransaction(this.addTransactions);

  void submitEntry() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTransactions(
      titleController.text,
      double.parse(amountController.text),
    );
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
