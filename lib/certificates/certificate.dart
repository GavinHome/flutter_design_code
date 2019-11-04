import 'package:flutter/material.dart';

class CertificateView extends StatefulWidget {
  CertificateView({Key key, this.item}) : super(key: key);

  final String item;

  @override
  _CertificateViewState createState() => _CertificateViewState();
}

class _CertificateViewState extends State<CertificateView> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 340,
            height: 220,
            decoration: new BoxDecoration(
                color: const Color(0xff000000),
                borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    blurRadius: 20.0,
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 18, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('UI Design',
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Color.fromARGB(0xFF, 0x5E, 0xCD, 0xFA))),
                          Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              'Certificate',
                              style: TextStyle(
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: new Image.asset(
                              "assets/Logo.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: <Widget>[
                      new Image.asset(
                        "assets/Background.png",
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.bottomCenter,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
