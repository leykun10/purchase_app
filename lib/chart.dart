import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:purchaseup/chart_bar.dart';
import "./Transaction.dart";
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  List<Transaction> recent_transaction;
  Chart(this.recent_transaction);
  @override

  List<Map<String, Object>> get grouped_transaction{
    return List.generate(7, (index) {
      final weekdays = DateTime.now().subtract(Duration(days: index));
      double total_sum=0;
      for(int i=0;i<recent_transaction.length;i++){
        if(recent_transaction[i].date.day==weekdays.day &&
          recent_transaction[i].date.month==weekdays.month &&
          recent_transaction[i].date.year==weekdays.year){
          total_sum=recent_transaction[i].amount+total_sum;

}
}
      return {'day':DateFormat.E().format(weekdays),'amount':total_sum};
    });
  }
 double percentage=0;
  Widget build(BuildContext context) {
    for(int i=0;i<grouped_transaction.length;i++){
      percentage+=grouped_transaction[i]["amount"];

    }
   return Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: recent_transaction.isEmpty?[Text("no chart to show",style: TextStyle(fontSize: 28),),]:grouped_transaction.map((e) {

      return Chart_bar(e["day"],e["amount"],percentage);
}).toList(),);
  }
}
