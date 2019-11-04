import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              decoration: new BoxDecoration(
                  color: const Color(0xff000000),
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(10.0))),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 25, bottom: 10),
                              child: Text('UI Design',
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              0xFF, 0x5E, 0xCD, 0xFA))),
                            ),
                            Text(
                              'Certificate',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: const Color(0xffffffff)),
                            ),
                          ],
                        ),
                        new Image.asset(
                          "assets/Logo.png",
                          //alignment: Alignment.center,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Column(
                      children: <Widget>[
                        new Image.asset(
                          "assets/Background.png",
                          alignment: Alignment.center,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
