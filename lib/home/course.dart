import 'package:flutter/material.dart';

class CourseView extends StatelessWidget {
  CourseView({Key key, this.course}) : super(key: key);
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 246,
                height: 360,
                decoration: new BoxDecoration(
                    color: course.backgroundColor,
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(30.0)),
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                          blurRadius: 20.0,
                          color: course.shadowColor,
                          spreadRadius: 2,
                          offset: Offset(0, 20)),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 150,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(course.title,
                              textAlign: TextAlign.start,
                              strutStyle: StrutStyle(leading: 1),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xffffffff)))
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: <Widget>[
                          new Image.asset(
                            course.image,
                            width: 246,
                            height: 150,
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
        ));
  }
}

class CoursesView extends StatelessWidget {
  List<Widget> getCourses() {
    return courses.map((Course item) {
      return new CourseView(course: item);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Courses',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 25)),
                ),
                Container(
                    child: Text(
                  '22 courses',
                  style: Theme.of(context)
                      .textTheme
                      .body2
                      .copyWith(color: const Color(0xff808080)),
                ))
              ],
            ),
          ),
          Container(
              height: 450,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: getCourses(),
                ),
              ))
          // Expanded(
          //   child: ListView(
          //     padding: EdgeInsets.all(0),
          //       scrollDirection: Axis.horizontal, children: getCourses()),
          // ),
        ],
      ),
    );
  }
}

class Course {
  String title;
  String image;
  Color backgroundColor;
  Color shadowColor;

  Course(this.title, this.image, this.backgroundColor, this.shadowColor);
}

List<Course> courses = [
  new Course("Build an app with SwiftUI", "assets/Illustration1.png",
      const Color(0xff453cc9), Color.fromRGBO(0x45, 0x3c, 0xc9, 0.3)),
  new Course("Hello cat haha", "assets/Illustration2.png",
      const Color(0xffec7e7b), Color.fromRGBO(0xec, 0x7e, 0x7b, 0.3)),
  new Course("Build an app with SwiftUI", "assets/Illustration1.png",
      const Color(0xff453cc9), Color.fromRGBO(0x45, 0x3c, 0xc9, 0.3)),
  new Course("Hello cat haha", "assets/Illustration2.png",
      const Color(0xffec7e7b), Color.fromRGBO(0xec, 0x7e, 0x7b, 0.3)),
  new Course("Build an app with SwiftUI", "assets/Illustration1.png",
      const Color(0xff453cc9), Color.fromRGBO(0x45, 0x3c, 0xc9, 0.3)),
  new Course("Hello cat haha", "assets/Illustration2.png",
      const Color(0xffec7e7b), Color.fromRGBO(0xec, 0x7e, 0x7b, 0.3))
];
