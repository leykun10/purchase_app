import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Transaction.dart';
import 'package:intl/intl.dart';
import 'transition_item.dart';

class Transaction_widget extends StatefulWidget {
  @override
  final List<Transaction> transactions;
  final Function delete_transaction;
  Transaction_widget(this.transactions,this.delete_transaction);

  @override
  _Transaction_widgetState createState() => _Transaction_widgetState();
}

class _Transaction_widgetState extends State<Transaction_widget> {
  Widget build(BuildContext context) {
    return Container (

        height: (MediaQuery
            .of (context)
            .size
            .height) * 0.6,
        child: widget.transactions.isEmpty ? Column (children: <Widget>[
          Text ("No transaction added yet", style: TextStyle (fontSize: 28.0),),
          SizedBox (height: 20,),
          Container (height: (MediaQuery
              .of (context)
              .size
              .height) * 0.25,
            child: Image.asset (
              "assets/images/waiting.png", fit: BoxFit.cover,),)
        ],)
            : Container (padding: EdgeInsets.fromLTRB (0, 8, 0, 0),
          child: ListView(children: <Widget> [...widget.transactions.map((Tx) =>
              transition_item(
                key: ValueKey(Tx.id),
                transaction: Tx,delete_transaction: widget.delete_transaction,)).toList()],),

          ),
        );
  }



  }


