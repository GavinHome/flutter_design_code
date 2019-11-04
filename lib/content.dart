import 'package:flutter/material.dart';
import 'package:flutter_design_code/certificates/card.dart';
import 'package:flutter_design_code/certificates/certificate.dart';
import 'dart:math';

class ContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DesignCode',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContentPage(title: 'DesignCode'),
    );
  }
}

class ContentPage extends StatefulWidget {
  ContentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  double degree(int angle) {
    return angle * pi / 360;
  }

  @override
  Widget build(BuildContext context) {
    var _show  = false;
    var _color1 = new Color(0xffff0000);
    var _color2 = new Color(0xffffff00);
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: AlignmentDirectional.center, //分析 2
          children: <Widget>[
            Transform.rotate(
              angle: degree(23),
              child: Transform.scale(
                  scale: 0.85,
                  child: CardView(
                    color: _color1,
                    offset: Offset(0, 700),
                  )),
            ),
            Transform.rotate(
              angle: degree(18),
              child: Transform.scale(
                  scale: 0.9,
                  child: CardView(
                      color: _color2,
                      offset: Offset(0, 340))),
            ),
            Transform.rotate(
                angle: degree(5),
                origin: Offset(0, 0),
                
                child: GestureDetector(onTap: () {
                  setState(() {
                    _show = !_show;
                    _color1 = _show ? new Color(0xffffffff) : new Color(0xffff0000);
                    _color2 = _show ? new Color(0xff00ff00) : new Color(0xffffff00);
                  });
                },child: CertificateView(item: "111")),),
          ],
        ),
      ),
    );
  }
}
