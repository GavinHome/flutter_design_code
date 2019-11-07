import 'package:flutter/material.dart';
import 'package:flutter_design_code/certificates/content.dart';
import 'package:flutter_design_code/home/home.dart';
import 'package:flutter_design_code/notifications/notification.dart';

import 'certificates/certificates.dart';

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
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[HomePage(), ContentView(), NotificationPage()],
        controller: controller,
      ),
      //body: CertificationsPage(),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.content_copy),
            ),
            Tab(
              icon: Icon(Icons.settings),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}
