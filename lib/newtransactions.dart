import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final textController = TextEditingController();
  final amountController = TextEditingController();
  final Function newtx;
  NewTransactions({required this.newtx, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Card(
            child: TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: textController,
            ),
          ),
          Card(
            child: TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              newtx(textController.text, double.parse(amountController.text));
            },
            child: Text("Add Transaction"),
            style: ElevatedButton.styleFrom(primary: Colors.orange[900]),
          )
        ],
      ),
    );
  }
}
