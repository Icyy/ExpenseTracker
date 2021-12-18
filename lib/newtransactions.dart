import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function newtx;
  NewTransactions({required this.newtx, Key? key}) : super(key: key);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final textController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final String txt = textController.text;
    final double amt = double.parse(amountController.text);
    if (txt.isEmpty || amt.isNegative) {
      return;
    }
    widget.newtx(txt, amt);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Card(
            child: TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: textController,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.name,
            ),
          ),
          Card(
            child: TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: submitData,
            child: const Text("Add Transaction"),
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
