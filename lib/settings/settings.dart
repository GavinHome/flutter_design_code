import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_counter/flutter_counter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();
  bool receive = false;
  int number = 1;
  int selection = 1;
  DateTime date = DateTime.now();
  String email = "";
  bool submit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Receive Notifications"),
                  Column(
                    children: <Widget>[
                      Switch(
                        value: receive,
                        onChanged: (bool value) {
                          setState(() {
                            receive = value;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("$number Notification${number > 1 ? 's' : ''} per week"),
                  Column(
                    children: <Widget>[
                      Counter(
                        initialValue: number,
                        minValue: 1,
                        maxValue: 10,
                        step: 1,
                        decimalPlaces: 0,
                        onChanged: (value) {
                          // get the latest value from here
                          setState(() {
                            number = value;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[Text("Favorite course")],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("SwiftUI",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subhead
                                      .copyWith())
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: const Color(0xffcccccc),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(5.0),
                    //     side: BorderSide(color: Colors.white, style: BorderStyle.none,width: 0)
                    //     ),
                    // color: const Color(0xffffffff),
                    child: GestureDetector(
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1),
                            maxTime: DateTime(2022, 12, 31),
                            onConfirm: (value) {
                          date = value;
                          setState(() {});
                        }, currentTime: DateTime.now(), locale: LocaleType.zh);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[Text("Date")],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                " $date",
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                initialValue: email,
                onChanged: (value) => setState(() {
                  email = value;
                }),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));

                      showDialog<Null>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            title: new Text('ok, Thanks!'),
                            content: new SingleChildScrollView(
                              child: new ListBody(
                                children: <Widget>[
                                  new Text("Email:$email"),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text('确定'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      ).then((val) {
                        print(val);
                      });
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
