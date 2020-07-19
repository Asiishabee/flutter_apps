
import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'package:expenses_app/widget/new_transaction.dart';
import 'package:expenses_app/widget/transaction_list.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "expenses demo",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  final List<Transaction> _userTransactions = [

    Transaction(
      id: 'T1',
      title: 'Shopping',
      amount: 69.99,
      date: DateTime.now(),
    ),

    Transaction(
      id: 'T2',
      title: 'Groceries',
      amount: 170.99,
      date: DateTime.now(),
    ),

    Transaction(
      id: 'T3',
      title: 'Education',
      amount: 1500.00,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount){
    final newTx =Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }


  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {

      return GestureDetector(
        onTap: () {},
        child: NewTransaction(_addNewTransaction),
        behavior:HitTestBehavior.opaque,
      ) ;
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense App"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
            onPressed: () =>  _startAddNewTransaction(context),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text("CHART"),
              ),
            ),
            TransactionList(_userTransactions),


          ],),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>  _startAddNewTransaction(context),
      ),
    );
  }
}
