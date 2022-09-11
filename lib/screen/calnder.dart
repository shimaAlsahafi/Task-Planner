import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel, WeekdayFormat;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:provider/provider.dart';

import 'package:task_panner/model/taskdata.dart';


class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    List months = ['jan','feb','mar','april','may','jun','july','aug','sep','oct','nov','dec'];
    var someDateTime = new DateTime.now();
    var mon = someDateTime.month;
    var monthes=months[mon-1];
 String def_month =' ${monthes[0].toUpperCase()}${monthes.substring(1)} ';
    return Scaffold(backgroundColor:  Color(0xff6fbedc),
      body: Padding(
        padding: const EdgeInsets.only(top: 100,left: 10,right: 10),
        child:Consumer<TaskData>(builder: (context,calender,child){
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Padding(
                  padding: const EdgeInsets.all(13.0),
                  child:   Text('${calender.month_of_calender??def_month} ${calender.year??someDateTime.year}',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),

              ),

              Container(
                child: CalendarCarousel<Event>(
                  onDayPressed: (DateTime date, List<Event> events) {
                    //take an action with date and its events
                    print(date);

                  },
                  thisMonthDayBorderColor: Colors.transparent ,
                  selectedDayButtonColor: Color(0xFF1d335c),
                  selectedDayBorderColor: Color(0xFF1d335c),
                  selectedDayTextStyle: TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(color: Colors.white),
                  daysTextStyle: TextStyle(color: Colors.white),scrollDirection: Axis.vertical,
                  nextDaysTextStyle:  TextStyle(color: Colors.white.withOpacity(0.5)),
                  prevDaysTextStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  weekdayTextStyle:TextStyle(color: Colors.white),
                  weekDayFormat: WeekdayFormat.short,onCalendarChanged: (value){
                  Provider.of<TaskData>(context,listen: false).ChangeMontandyear(value.month,value.year);
                  print(value.month);
                },onDayLongPressed: (value){


                },markedDateCustomTextStyle: TextStyle(color: Colors.white),
                  firstDayOfWeek: 0,
                  isScrollable: true,showHeader: false,
                  weekFormat: false,
                  height: 400.0,
                  selectedDateTime: someDateTime,

                  customGridViewPhysics: NeverScrollableScrollPhysics(),
                  //to add event
   markedDatesMap: calender.getCarouselMarkedDates(),


          markedDateWidget: Container(
                    height: 4,
                    width: 10,
                    decoration: new BoxDecoration(
                      color:calender.colorofTask(),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
              ),


            ],
          );
        },)
      ),
    );
  }}
