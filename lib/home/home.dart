import 'package:flutter/material.dart';
import 'package:flutter_design_code/certificates/certificates.dart';
import 'package:flutter_design_code/certificates/content.dart';
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
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      GestureDetector(child: ContentView(),
                      onTap: () => Navigator.pop(context),),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = Offset(0.0, 1.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ));

              // showDialog<Null>(
              //   context: context,
              //   barrierDismissible: true,
              //   builder: (BuildContext context) {
              //     return Scaffold(
              //       body: GestureDetector(
              //         child: ContentView(),
              //         onTap: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //     );
              //   },
              // ).then((val) {
              //   print(val);
              // });
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
        scrollDirection: Axis.vertical,
        children: <Widget>[CoursesPage(), CertificationsPage()],
      )),
      drawer: Drawer(
        child: MenusPage(),
      ),
    );
  }
}
