import 'package:flutter/widgets.dart';

class Task{
final  int Day;
final  int Month;
final  String Hour;
final  String Min;
final  String titel;
final  String note;
Color color;
var date;
  bool isdone;
  Task(

      {this.date,this.color,this.Day,
      this.Month,
      this.Hour,
      this.Min,
      this.titel,
      this.note,
      this.isdone = false});
void toggleDone() {
  isdone = !isdone;
}



}