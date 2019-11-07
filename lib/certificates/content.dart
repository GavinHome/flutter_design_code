import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_design_code/certificates/card.dart';
import 'package:flutter_design_code/certificates/certificates.dart';

class ContentView extends StatefulWidget {
  ContentView({Key key}) : super(key: key);

  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
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
                            ? new Color(0xffe64ad9)
                            : new Color(0xff803cc9),
                        offset: _show ? Offset(0, 120) : Offset(0, 120),
                      )),
                ),
                Transform.rotate(
                  angle: _show ? degree(10) : degree(0), //18
                  child: Transform.scale(
                      scale: 0.9,
                      child: CardView(
                          color: _show
                              ? new Color(0xff674eec)
                              : new Color(0xff453cc9),
                          offset: _show ? Offset(0, 55) : Offset(0, 55))),
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
                      child: CertificateItem(item: CertificateModel(title: "UI Design", image: "assets/Certificate1.png", width: 340, height: 220))),
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
