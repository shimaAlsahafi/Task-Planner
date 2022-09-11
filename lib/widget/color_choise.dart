import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_panner/model/taskdata.dart';

class ColorCircle extends StatelessWidget {
  final Color color;
final  Widget widget;
   ColorCircle({ this.color,this.widget});
  @override
  Widget build(BuildContext context) {

    
    return  Container(child:Center(child:widget ,),height: 30,width: 30,decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(30)),);
  }
}

class ColorChoise extends StatelessWidget {
  @override


  bool isSelected=true;
  List<bool> select=[false,false,false,false];
  TaskData data;
  List<Color> colorlist=[ Color(0xFF1d335c), Color(0xfff97173),Color(0xfffec867),Color(0xffcad3b8)];
  @override
  Widget build(BuildContext context) {

    return   Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Color',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
       Consumer<TaskData>(builder: (context, taskData, index) {

          return Row(children: [
            InkWell(onFocusChange: (value){

            },onTap:(){
              taskData.IsSelected(isSelected,0);
            print(  'dddd${taskData.isSelected}');
              select[0]=taskData.isSelected;
            print(isSelected);

            },child: ColorCircle(color: Color(0xFF1d335c),widget: select[0]? Icon(Icons.check,color: Colors.white,):Container(),)), SizedBox(width: 4,),

            InkWell(onTap:()=>{taskData.IsSelected( select[1],1), select[1]=taskData.isSelected},child: ColorCircle(color: Color(0xfff97173),widget:  select[1]?Center(child: Icon(Icons.check,color: Colors.white,),):null,)), SizedBox(width: 4,),
            InkWell(onTap:()=>{taskData.IsSelected( select[2],2), select[2]=taskData.isSelected},child: ColorCircle(color: Color(0xfffec867),widget: select[2]?Center(child: Icon(Icons.check,color: Colors.white,),):null,)), SizedBox(width: 4,),
            InkWell(onTap:()=>{taskData.IsSelected( select[3],3), select[3]=taskData.isSelected},child: ColorCircle(color: Color(0xffcad3b8),widget:   select[3]?Center(child: Icon(Icons.check,color: Colors.white,),):null,)), SizedBox(width: 4,),


          ]);
          },)




                ],),



    );

  }
}

