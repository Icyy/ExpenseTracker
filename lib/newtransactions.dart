import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final textController = TextEditingController();
  final amountController = TextEditingController();
  final Function newtx;
  NewTransactions({required this.newtx, Key? key}) : super(key: key);

  void submitData() {
    final String txt = textController.text;
    final double amt = double.parse(amountController.text);
    if (txt.isEmpty || amt.isNegative) {
      return;
    }
    newtx(txt, amt);
  }

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
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.name,
            ),
          ),
          Card(
            child: TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: submitData,
            child: Text("Add Transaction"),
            style: ElevatedButton.styleFrom(primary: Colors.orange[900]),
          )
        ],
      ),
    );
  }
}
