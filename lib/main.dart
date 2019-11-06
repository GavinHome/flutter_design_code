import 'package:flutter/material.dart';
import 'package:flutter_design_code/settings/settings.dart';
//import 'package:flutter_design_code/notifications/notification.dart';
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
      // home: Scaffold(
      //   //body: CoursesView(),
      //   body: NotificationDetailPage(notification: NotificationModel(
      // "assets/Certificate4.png",
      // "Angular",
      // "了解如何使用高级合成、布局、图形和动画在Angular中构建自定义视图和控件看一个高性能的演示，可动画控制和观看它在代码中一步一步深入了解迅捷的布局体系",
      // "JUN 26"),),
     // home: Scaffold(body: NotificationPage()),      
     home: Scaffold(body: SettingsPage(),),
    );
  }
}
