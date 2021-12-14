import 'dart:ui';
import './displaytransactions.dart';

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
    );
  }
}

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: Column(
        children: [
          Card(
            child: Text("Chart"),
          ),
          DisplayTransactions()
        ],
      ),
    );
  }
}
