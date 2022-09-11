import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_panner/model/taskdata.dart';
import 'package:task_panner/page/addTask_page.dart';

class TaskWidget extends StatelessWidget {

 var date =DateTime.now();
  @override
  Widget build(BuildContext context) {

 return Container(height: 300 ,width:MediaQuery.of(context).size.width,

           child: Consumer<TaskData>(
             builder: (context,taskdata,child){

               return Expanded(
                 child: Container(padding: EdgeInsets.only(top: 40,right: 10),height: 100,width: 300,child: ListView.builder(scrollDirection: Axis.vertical,itemCount:taskdata.task.length ,itemBuilder:(context,index){
                   print(' task ${taskdata.task.length}');
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Material(color: Colors.transparent,
                       child: InkWell(onTap: (){},onLongPress: (){
                         taskdata.ubdattask(taskdata.task[index]);
                       },
                         child:Ink(height: 100,width: 300,child:Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(bottom: 10,left: 10,),
                               child: Text('${DateFormat('EEEE, d MMM  hh:mm a').format(taskdata.task[index].date)==DateFormat('EEEE, d MMM hh:mm a').format(date)?"Today":DateFormat('EEEE, d MMM hh:mm a').format(taskdata.task[index].date)} ',
                                 style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color:taskdata.task[index].color),),
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left: 30),
                               child: Row(

                                 children: [
                                   Container(color:taskdata.task[index].color,child: VerticalDivider(
                                     thickness: 1, width: 2,
                                     indent: 25,
                                     endIndent: 25,)),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 20),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(taskdata.task[index].titel??'  ',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
                                         Text(taskdata.task[index].note??' ',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: Colors.black54),),
                                       ],
                                     ),
                                   ),


                                 ],
                               ),
                             ),
                          Divider(thickness: 0.5,) ],
                         ),
                       ),
                   ),
                     ));})),
               );
             },
           ),
      );


  }
}
