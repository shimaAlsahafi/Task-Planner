
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_panner/model/taskdata.dart';

class PickerNumber extends StatefulWidget {

  @override
  _PickerNumberState createState() => _PickerNumberState();
}

class _PickerNumberState extends State<PickerNumber> {
int valueDay=3,valueMonth=5,valueHour=12,valueMinute=1;

  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskdat,child){

        return  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Column(
            children: [
              Text('Day',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
              NumberPicker(haptics: true,selectedTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                  itemHeight: 30,itemWidth: 30,textStyle: TextStyle(color: Colors.grey),
                  value: valueDay,minValue: 1,maxValue: 30,
                  onChanged: (value) => setState(() => { valueDay = value ,valueDay==null?valueDay:valueDay,taskdat.day_of_event=valueDay},)),

            ],
          ),
          Column(
            children: [
              Text('Month',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
              NumberPicker(haptics: true,selectedTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                  itemHeight: 30,itemWidth: 30,textStyle: TextStyle(color: Colors.grey),
                  value:valueMonth,minValue: 1,maxValue: 12,
                  onChanged: (value) => setState(() => { valueMonth = value,taskdat.month_of_event=valueMonth,}),),

            ],
          ),
          Column(
            children: [
              Text('Hour',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
              NumberPicker(infiniteLoop: true,haptics: false,selectedTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                  itemHeight: 30,itemWidth: 30,textStyle: TextStyle(color: Colors.grey),
                  value:valueHour,minValue: 1,maxValue: 12,
                  onChanged: (value) => setState(() => {valueHour = value,taskdat.hour=valueHour})),

            ],
          ),
          Column(
            children: [
              Text('Minute',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
              NumberPicker(haptics: true,selectedTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                  itemHeight: 30,itemWidth: 30,textStyle: TextStyle(color: Colors.grey),
                  value:valueMinute,
                  minValue: 1,
                  maxValue: 60,
    onChanged: (value) => setState(() => { valueMinute = value,taskdat.min=valueMinute})),


            ],
          ),


        ],);
      },
    );
  }
}
