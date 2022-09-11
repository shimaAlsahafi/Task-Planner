import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_panner/page/addTask_page.dart';
import 'package:task_panner/screen/calnder.dart';
import 'package:task_panner/widget/task_widget.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Calender(),
          Positioned(bottom: 0,child: TaskWidget())
        ],
      ),
   floatingActionButton:Padding(
     padding: EdgeInsets.only(right: 20,bottom: 20),
     child: GestureDetector(onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context){return AddTask();} ));},child: Container(child: Icon(Icons.add,color: Colors.white,size: 30,),height: 60,width: 060,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Color(0xfff97173)),),),
   )
    );
  }
}
