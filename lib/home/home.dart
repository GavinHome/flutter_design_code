import 'package:flutter/material.dart';
import 'package:flutter_design_code/certificates/certificates.dart';
import 'package:flutter_design_code/courses/courses.dart';
import 'package:flutter_design_code/home/menu.dart';
import 'package:flutter_design_code/notifications/notification.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            tooltip: "person",
            onPressed: () {
              //todo: display content
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            tooltip: "notifications",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
        ],
      ),
      body: Center(
          child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          CoursesPage(), 
          CertificationsPage()],
      )),
      drawer: Drawer(
        child: MenusPage(),
      ),
    );
  }
}
