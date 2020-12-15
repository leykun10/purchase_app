import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
class Chart_bar extends StatelessWidget {
  final String label;
  final double spending_amount;
  final double total_spending_amount;

 Chart_bar(this.label,this.spending_amount,this.total_spending_amount);
  @override

  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(context, constraints){

      return Container(
        height: constraints.maxHeight,
        child: FittedBox(
          child: Column(children: <Widget>[Container(
              height: constraints.maxHeight*0.17,child: FittedBox(child: Text('${spending_amount.toStringAsFixed(0)}'))),
          SizedBox(height: 4,),Container(
            height: constraints.maxHeight*0.55,
            width: 12,
            child: FractionallySizedBox(

                alignment: Alignment.bottomLeft,
                heightFactor:spending_amount/(total_spending_amount*2),
                child: Container(
                  decoration: BoxDecoration(borderRadius:BorderRadius.circular(5) ,color: spending_amount>=total_spending_amount/2?Colors.blue:Colors.red),
                )),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius:BorderRadius.circular(5) ),),SizedBox(height: 4,),Container(
                height: constraints.maxHeight*0.17,
                child: FittedBox(child: Text(label)))],),
        ),
      );});

  }
}
