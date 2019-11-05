import 'package:flutter/material.dart';
import 'package:flutter_design_code/notifications/notification.dart';
//import 'home/course.dart';
//import 'myapp.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DesignCode',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ContentView(),
      home: Scaffold(
        //body: CoursesView(),
        body: NotificationPage(),
      )
    );
  }
}
