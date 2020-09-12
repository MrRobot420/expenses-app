import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransactions;

  NewTransaction(this.addTransactions);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Betrag in €'),
              controller: amountController,
            ),
            FlatButton(
              onPressed: () {
                // TO DO: Button implementieren
                print(titleController.text);
                print(amountController.text);
                addTransactions(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: Text('Hinzufügen'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
