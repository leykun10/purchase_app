import 'package:flutter/material.dart';
import 'transition_widget.dart';
import 'Transaction.dart';
import 'package:intl/intl.dart';
class transition_item extends StatefulWidget {
  final Transaction transaction;
  final Function delete_transaction;

  transition_item({Key key,this.transaction,this.delete_transaction}) : super(key:key);

  @override
  _transition_itemState createState() => _transition_itemState();
}

class _transition_itemState extends State<transition_item> {
  @override
  Widget build(BuildContext context) {
    return Padding (

        padding: const EdgeInsets.all(2.0),
        child: Card (

            elevation: 5,
            margin: EdgeInsets.all (2),
            child: Padding (
              padding: EdgeInsets.fromLTRB (0, 5, 8, 8),
              child: ListTile (subtitle: Text (
                DateFormat.yMd ().format (widget.transaction
                    .date),
                style: TextStyle (fontSize: 20),),
                title: Text (widget.transaction.title,
                  style: TextStyle (fontSize: 20),)
                , trailing: IconButton (icon: Icon (Icons.delete),
                  onPressed: () {
                    setState (() {
                    widget.delete_transaction(widget.transaction);
                    });
                  },), leading: CircleAvatar (
                  radius: 30,
                  child: FittedBox (
                      child: Text (
                          '\$ ${widget.transaction
                              .amount}')),),),
            )));
  }
}
