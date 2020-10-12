import 'package:flutter/material.dart';
import 'transaction.dart';
import 'TransactionList.dart';

class Layout1 extends StatefulWidget {
  @override
  _Layout1 createState() => _Layout1();
}

class _Layout1 extends State<Layout1>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
   final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  //define state
  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = new List<Transaction>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Layout 1'),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Content'),
                controller: _contentController,
                onChanged: (text){
                  this.setState(() {
                    _transaction.content = text;
                  });
                },
              ),

              TextField(
                decoration: InputDecoration(labelText: 'Amount(money)'),
                controller: _amountController,
                onChanged: (text){
                  this.setState(() {
                    _transaction.amount = double.tryParse(text) ?? 0;
                  });
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),

              ButtonTheme(
                height: 50,
                child: FlatButton(
                onPressed: (){
                  setState(() {
                    _transactions.add(_transaction);
                    //_transaction = Transaction(content: '', amount: 0.0);
                    _contentController.text = '';
                    _amountController.text = '';
                  });

                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text('Transaction list: '+_transactions.toString()),
                      duration: Duration(seconds: 3),
                    )
                  );
                },
                color: Colors.pinkAccent,
                textColor: Colors.white,
                child: Text('Insert Transaction', style: const TextStyle(fontSize: 18),)
                ),
              ),

              TransactionList(transactions: _transactions)
            ],
          ),
          ),
        ),
    );
  }
}