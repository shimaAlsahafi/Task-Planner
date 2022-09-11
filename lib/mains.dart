import 'package:flutter/material.dart';
import 'package:task_panner/model/taskdata.dart';
import 'package:task_panner/page/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => TaskData(),
    child: MaterialApp(debugShowCheckedModeBanner: false,checkerboardOffscreenLayers: true,
      title: 'Flutter Demo',
      home:HomePage(),
    ));
  }
}
