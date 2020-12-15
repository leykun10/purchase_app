import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:purchaseup/Transaction.dart';
class Fields extends StatefulWidget {
final Function add_to_list;
final List<Transaction> transaction;

Fields(this.add_to_list,this.transaction){
 print("constructor invoked");
}

@override
  _FieldsState createState(){
    print("create state");

    return _FieldsState();}
}

class _FieldsState extends State<Fields> {
  _FieldsState(){
    print("constructor invoked");
  }
  final titlecontroller=TextEditingController();
 
  final pricecontroller=TextEditingController();
  DateTime selected_date;
  @override
  void initState() {
    print("state initialized");
    super.initState();
  }
  @override
  void didUpdateWidget(Fields oldWidget) {
    // TODO: implement didUpdateWidget
    print("update widget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    print("disposed");
    // TODO: implement dispose
    super.dispose();
  }
  void display_day(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime.now()).then((value) {
     setState(() {
       selected_date=value;
     });      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: 300,
          child: SingleChildScrollView(
            child: Card(child: Container(
              padding: EdgeInsets.fromLTRB(10,10,10,8),

                child: Column(

              children: <Widget>[
                TextField(
                  controller: titlecontroller,decoration: InputDecoration(labelText: "title",
                    labelStyle: TextStyle(color: Colors.black,fontSize: 18)),cursorColor:
                Colors.black,style:TextStyle(color: Colors.black),),
                TextField(keyboardType: TextInputType.number,

                  controller: pricecontroller,decoration: InputDecoration(labelText: "price"),),
                Row(
                  children: <Widget>[Expanded(child: Text(selected_date==null?"No date selected":"${DateFormat.yMd().format(selected_date)}")),
                    RaisedButton(child: Text("choose date"),onPressed: display_day ,),
                  ],
                )
                ,FlatButton(onPressed: (){
                  print(" ${selected_date}");
                  widget.add_to_list(pricecontroller.text,
                     titlecontroller.text,selected_date,(widget.transaction.length++).toString());

                  titlecontroller.clear();
                  pricecontroller.clear();
                },child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.add),Text("Add to purshase",style: TextStyle(color: Colors.redAccent,fontSize: 18),)],),)
              ],
            )),),
          ),
        ),
      ],
    );
  }
}
