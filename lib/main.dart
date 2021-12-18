import 'dart:ui';
import 'package:expense_app/newtransactions.dart';
import 'package:expense_app/transactionslist.dart';

import 'package:expense_app/transaction.dart';
import 'package:flutter/material.dart';

void main() => {runApp(MyApp())};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      home: MyAppWidget(),
      theme: ThemeData(primarySwatch: Colors.orange, accentColor: Colors.amber),
    );
  }
}

class MyAppWidget extends StatefulWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  State<MyAppWidget> createState() => _MyAppWidgetState();
}

class _MyAppWidgetState extends State<MyAppWidget> {
  final List<Transactions> transactions = [
    // Transactions(id: 1, name: "Milk", amount: 20, date: DateTime.now()),
    // Transactions(id: 2, name: "Bread", amount: 40, date: DateTime.now())
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

  void _startAddNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransactions(newtx: _addtransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
              onPressed: () => {_startAddNewTransactions(context)},
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView(
        children: [
          Card(
            child: const Text("Chart"),
          ),
          TransactionsList(transactions: transactions)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_startAddNewTransactions(context)},
        child: const Icon(Icons.add),
      ),
    );
  }
}
