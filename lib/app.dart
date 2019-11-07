import 'package:flutter/material.dart';
import 'package:flutter_design_code/certificates/certificate.dart';
import 'package:flutter_design_code/home/course.dart';
import 'package:flutter_design_code/home/home.dart';
import 'package:flutter_design_code/notifications/notification.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DesignCode',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class AppPage extends StatefulWidget {
  AppPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      // appBar: AppBar(
      //   // Title
      //   title: Text("Using Bottom Navigation Bar"),
      //   // Set the background color of the App Bar
      //   backgroundColor: Colors.blue,
      // ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[HomePage(), CertificateView(), NotificationPage()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.content_copy),
            ),
            Tab(
              icon: Icon(Icons.settings),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}
