import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  Preview({Key key, this.child}) : super(key: key);
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.redAccent,
      ),
      home: child,
    );
  }
}
