
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:task_panner/model/task.dart';
import 'package:task_panner/model/taskdata.dart';
import 'package:task_panner/widget/color_choise.dart';
import 'package:task_panner/widget/piker_widget.dart';
class AddTask extends StatefulWidget {
  Task task;
  AddTask({this.task});
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String titel;
  String note;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6fbedc),
      appBar: AppBar(elevation: 0,backgroundColor: Color(0xff6fbedc) ,
        leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.close,color: Colors.white,size: 20,),),),
      body: SingleChildScrollView(
        child: Container(height: MediaQuery.of(context).size.height,
          child: Form(key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text('Add Note',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,)),
                ),
SizedBox(height: 50,),
Expanded(flex:1,child:   Container(child: Container(constraints:
    BoxConstraints.expand(),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
            Text('Date and Time',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
     SizedBox(height: 20,),
PickerNumber(),
            SizedBox(height: 30,),
            Text('Titel',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),

TextFormField(validator: (value) {
  if (value.isEmpty) {
    return "* Required";
  } else
    return null;
},onChanged: (value){
  titel=value;
  print(titel);
},decoration: InputDecoration(  focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,fillColor: Colors.grey.withOpacity(0.16),filled: true,),),
            SizedBox(height: 20,),
            Text('Notes',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),

            Container  ( height: 5 * 20.0,color: Colors.grey.withOpacity(0.16),child: TextFormField(validator: (value) {
    if (value.isEmpty) {
    return "* Required";
    } else
    return null;
    },onChanged: (value){
              note=value;
            },maxLines:
              1,decoration: InputDecoration(  focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,filled: true,),),
            ),

     ColorChoise()
    ],
  ),
),padding: EdgeInsets.only(top: 50,left: 20,right: 20),
    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
  ),),


              ],
            ),
          ),
        ),
      )
        ,floatingActionButton:Padding(
    padding: EdgeInsets.only(right: 20,bottom: 20),
    child: GestureDetector(onTap: (){

    if (formkey.currentState.validate()) {
    print("Validated");
    Provider.of<TaskData>(context,listen: false).addTask(titel, note);

    Navigator.pop(context);
    }else{
    print("Not Validated");
    }
    }



     ,
      child: Container(child: Center(child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),height: 60,width:100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Color(0xfff97173)),),),
    )  );
  }
}
