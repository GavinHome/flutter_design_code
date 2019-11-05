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
      home: ContentPage(),
    );
  }
}

class ContentPage extends StatefulWidget {
  ContentPage({Key key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  var _show = false;
  double degree(int angle) {
    return angle * pi / 180;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            TitleView(),
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Transform.rotate(
                  angle: _show ? degree(15) : degree(0), //23
                  child: Transform.scale(
                      scale: 0.8,
                      child: CardView(
                        color: _show
                            ? new Color(0xffffffff)
                            : new Color(0xffff0000),
                        offset: _show ? Offset(0, 120) : Offset(0, 0),
                      )),
                ),
                Transform.rotate(
                  angle: _show ? degree(10) : degree(0), //18
                  child: Transform.scale(
                      scale: 0.9,
                      child: CardView(
                          color: _show
                              ? new Color(0xff00ff00)
                              : new Color(0xffffff00),
                          offset: _show ? Offset(0, 55) : Offset(0, 0))),
                ),
                Transform.rotate(
                  angle: _show ? degree(5) : degree(0),
                  origin: Offset(0, 0),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _show = !_show;
                        });
                      },
                      child: CertificateView(item: "")),
                ),
              ],
            ),
            Expanded(
              child: CardBottomView(),
            ),
          ],
        ),
      ),
    );
  }
}
