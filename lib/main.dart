import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:purchaseup/Transaction.dart';
import './transition_widget.dart';
import './Textfields.dart';
import './chart.dart';
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: MyApp(),

      theme: ThemeData(primarySwatch:Colors.indigo,
      fontFamily: "PTSansNarrow",
      accentColor: Colors.blue),
    debugShowCheckedModeBanner: false,);
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  @override
  List<Transaction> transactions=[
  ];
  bool showchart=false;


  void add_list(String price,String title,DateTime date, String index){

    setState(() {

      transactions.add(Transaction(amount:double.parse(price),title: title,date: date,id: index));

    });
  }
   void delete_transactions(Transaction object){
    setState(() {
      transactions.remove(object);
    });

   }

  void start_transaction(BuildContext ctxt){

  showModalBottomSheet(context: ctxt,builder: (context){
    return Fields(add_list,transactions);
  });}

  List<Transaction> get recent_transaction{
  return  transactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  Widget build(BuildContext context) {
    Widget chartct=Container(
      height: MediaQuery.of(context).size.height*0.8*0.25,
      child: Card(

        child:Chart(recent_transaction),),

    );
    final bool orientation=MediaQuery.of(context).orientation==Orientation.landscape;
    return
       Scaffold(appBar: AppBar(
        actions: <Widget>[IconButton(icon: Icon(Icons.add),onPressed:
        (){ start_transaction(context);},)],
        title: Text("Purchase App"),),body:Container(
           height: (MediaQuery.of(context).size.height)*0.8,
           child: ListView(children: <Widget>[if(orientation)Row(mainAxisAlignment:
           MainAxisAlignment.end, children: <Widget>[Text("display chart"),
             Switch(value: false,onChanged:(val){
               setState(() {
                 showchart=val;

               });


             },)],),if(!orientation)chartct,
          if(!orientation) Container(height: MediaQuery.of(context).size.height*0.8*0.9,
               child: Transaction_widget(transactions,delete_transactions)),
             if(orientation)showchart?chartct:
               Container(height: MediaQuery.of(context).size.height*0.8*0.9,
                   child: Transaction_widget(transactions,delete_transactions))],)),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
    showModalBottomSheet(context: context,builder:(context){
    return Container(
        height: (MediaQuery.of(context).size.height)*1,
        child: Fields(add_list,transactions));
    } 
          );},
          child: Icon(Icons.add),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,);
  }
}

