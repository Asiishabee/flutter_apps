import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override

  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
          child: Row(children: <Widget>[
          Container(
          margin: EdgeInsets.symmetric(vertical:18, horizontal: 18),
          decoration: BoxDecoration(
          border: Border.all(color: Colors.indigo[700]),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
          '\$${transactions[index].amount.toStringAsFixed(2)}',
          style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.indigo[700],
          ),
          ),
          ),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Text(
          transactions[index].title,
          style: TextStyle(
          color: Colors.indigo[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}

