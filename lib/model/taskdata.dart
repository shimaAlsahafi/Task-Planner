

import 'package:flutter/cupertino.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:task_panner/model/task.dart';


class TaskData extends ChangeNotifier{
bool isSelected=false;
  List<Task> task=[];
  int indexofcolor=0;
List<Color> colorlist=[ Color(0xFF1d335c), Color(0xfff97173),Color(0xfffec867),Color(0xffcad3b8)];
  List months = ['jan','feb','mar','april','may','jun','july','aug','sep','oct','nov','dec'];
  String month_of_calender;int year=2021;  int month_of_event;int day_of_event;
String titel;String note;int day;int month;int hour;int min;




void ChangeMontandyear(int index,int years){
   month_of_calender=months[index-1];
  month_of_calender=' ${month_of_calender[0].toUpperCase()}${month_of_calender.substring(1)} ';
   year=years;
  notifyListeners();
}

  void addTask(String titel,String note){
    month=month_of_event;day=day_of_event;
    final  tasks=Task(titel: titel,note: note,Month: month,Day: day,color: colorlist[indexofcolor],date: DateTime.utc(year,month,day,hour,min));
   task.add(tasks);
    var date =DateTime.utc(year,month,day);
   print('month ${tasks.Month},day ${tasks.Day}, year ${year}');
    print(DateFormat('EEEE, d MMM').format(date));

    notifyListeners();
  }


 // need to check
  void IsSelected(bool selet,int index){
indexofcolor=index;

isSelected=!isSelected;;
    selet=isSelected;
    notifyListeners();


  }
void ubdattask(Task tasks){
  task.remove(tasks);
  notifyListeners();
}

Color colorofTask(){
  return colorlist[indexofcolor];
}
EventList<Event> getCarouselMarkedDates() {
  EventList<Event> dd =new EventList<Event>(events: {


    new DateTime(2019, 4, 3): [
      new Event(
        date: new DateTime(2019, 4, 3),
        title: 'Event 1',
      ),
    ]

  });
  for (var x = 0; x < dd.events.length; x++) {

  }

  try{
    dd.add(DateTime(year, month_of_event, day_of_event), Event(
      date: new DateTime(year, month_of_event, day_of_event),
      title:  'Event 1',
    ));
    print('y ${year} d ${day}, m ${month}');
    print(dd.events.length);

  }
  catch(e){

  }

  return dd;
}

}


