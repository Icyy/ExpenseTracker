import 'package:expense_app/newtransactions.dart';
import 'package:expense_app/transactionslist.dart';
import 'package:flutter/material.dart';
import 'transaction.dart';

class DisplayTransactions extends StatefulWidget {
  const DisplayTransactions({Key? key}) : super(key: key);

  @override
  _DisplayTransactionsState createState() => _DisplayTransactionsState();
}

class _DisplayTransactionsState extends State<DisplayTransactions> {
  final List<Transactions> transactions = [
    Transactions(id: 1, name: "Milk", amount: 20, date: DateTime.now()),
    Transactions(id: 2, name: "Bread", amount: 40, date: DateTime.now())
  ];

  void _addtransaction(String txTitle, double txAmount) {
    final newtx = Transactions(
      name: txTitle,
      amount: txAmount,
      id: 5,
      date: DateTime.now(),
    );
    setState(() {
      transactions.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactions(newtx: _addtransaction),
        TransactionsList(transactions: transactions),
      ],
    );
  }
}
