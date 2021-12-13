import 'dart:ui';
import 'package:intl/intl.dart';
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
  List<Transactions> transactions = [
    Transactions(id: 1, name: "Milk", amount: 20, date: DateTime.now()),
    Transactions(id: 2, name: "Bread", amount: 40, date: DateTime.now())
  ];

  MyAppWidget({Key? key}) : super(key: key);

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
          Column(
            children: transactions.map((transaction) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        '${transaction.amount} ₹',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.deepOrange,
                            width: 2,
                            style: BorderStyle.solid),
                      ),
                      padding: EdgeInsets.all(6),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.name,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMMd().format(transaction.date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
