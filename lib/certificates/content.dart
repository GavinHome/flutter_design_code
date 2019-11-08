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

  double screenWidth;
  double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  TitleView(),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _show = !_show;
                        });
                      },
                      child: Transform.rotate(
                        angle: _show ? degree(15) : degree(0), //23
                        child: Transform.scale(
                            scale: 0.85,
                            child: CardView(
                              color: _show
                                  ? new Color(0xffe64ad9)
                                  : new Color(0xff803cc9),
                              offset: _show ? Offset(0, 120) : Offset(0, 120),
                            )),
                      ),
                    ),
                    top: _show ? screenHeight / 2 - 425 : screenHeight / 2 - 55,
                    left:
                        _show ? screenHeight / 2 - 300 : screenWidth / 2 - 170,
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _show = !_show;
                        });
                      },
                      child: Transform.rotate(
                        angle: _show ? degree(10) : degree(0), //18
                        child: Transform.scale(
                            scale: 0.92,
                            child: CardView(
                                color: _show
                                    ? new Color(0xff674eec)
                                    : new Color(0xff453cc9),
                                offset: _show ? Offset(0, 55) : Offset(0, 55))),
                      ),
                    ),
                    top: _show ? screenHeight / 2 - 220 : screenHeight / 2 - 25,
                    left: _show ? screenWidth / 2 - 150 : screenWidth / 2 - 170,
                  ),
                  AnimatedPositioned(
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _show = !_show;
                        });
                      },
                      child: Transform.rotate(
                        angle: _show ? degree(5) : degree(0),
                        origin: Offset(0, 0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _show = !_show;
                              });
                            },
                            child: CertificateItem(
                                item: CertificateModel(
                                    title: "UI Design",
                                    image: "assets/Certificate1.png",
                                    width: 340,
                                    height: 220))),
                      ),
                    ),
                    top: screenHeight / 2,
                    left: screenWidth / 2 - 170,
                  ),
                ],
              ),
            ),
            CardBottomView()
          ],
        ),
      ),
      // body: Container(
      //   child: Column(
      //     children: <Widget>[
      //       //TitleView(),
      //       // Stack(
      //       //   alignment: AlignmentDirectional.center,
      //       //   children: <Widget>[
      //       //     // Transform.rotate(
      //       //     //   angle: _show ? degree(15) : degree(0), //23
      //       //     //   child: Transform.scale(
      //       //     //       scale: 0.8,
      //       //     //       child: CardView(
      //       //     //         color: _show
      //       //     //             ? new Color(0xffe64ad9)
      //       //     //             : new Color(0xff803cc9),
      //       //     //         offset: _show ? Offset(0, 120) : Offset(0, 120),
      //       //     //       )),
      //       //     // ),
      //       //     // Transform.rotate(
      //       //     //   angle: _show ? degree(10) : degree(0), //18
      //       //     //   child: Transform.scale(
      //       //     //       scale: 0.9,
      //       //     //       child: CardView(
      //       //     //           color: _show
      //       //     //               ? new Color(0xff674eec)
      //       //     //               : new Color(0xff453cc9),
      //       //     //           offset: _show ? Offset(0, 55) : Offset(0, 55))),
      //       //     // ),
      //       //     // Transform.rotate(
      //       //     //   angle: _show ? degree(5) : degree(0),
      //       //     //   origin: Offset(0, 0),
      //       //     //   child: GestureDetector(
      //       //     //       onTap: () {
      //       //     //         setState(() {
      //       //     //           _show = !_show;
      //       //     //         });
      //       //     //       },
      //       //     //       child: CertificateItem(item: CertificateModel(title: "UI Design", image: "assets/Certificate1.png", width: 340, height: 220))),
      //       //     // ),

      //       //   ],
      //       // ),
      //       // Expanded(
      //       //   child: CardBottomView(),
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }
}
