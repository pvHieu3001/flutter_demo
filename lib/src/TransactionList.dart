
import 'package:flutter/material.dart';
import 'transaction.dart';

class TransactionList extends StatelessWidget{
  List<Transaction> transactions;
  TransactionList({this.transactions});

  ListView _buildListView(){
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index){
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          color: (index-1)%2==0 ? Colors.green : Colors.teal,
          elevation: 10,
          child: ListTile(
          leading: const Icon(Icons.access_alarm),
          title:  Text(transactions[index].content),
          subtitle:  Text('price: ${transactions[index].amount}', style: TextStyle(fontSize: 18, color: Colors.white),),
          onTap: (){
            print('You click: ${transactions[index].content}');
          },
        )
        );
      }
    );
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _buildListView()
    );
  }

} 
