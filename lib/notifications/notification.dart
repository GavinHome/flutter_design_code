import 'package:flutter/material.dart';
import 'package:flutter_design_code/settings/settings.dart';

class NotificationDetailPage extends StatelessWidget {
  NotificationDetailPage({Key key, this.notification}) : super(key: key);
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30),
                decoration: new BoxDecoration(
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(10.0)),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: 18, left: 10, right: 10, bottom: 20),
                      child: Text(notification.title,
                          style: Theme.of(context).textTheme.title.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(0xFF, 0x5E, 0xCD, 0xFA))),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: <Widget>[
                          new Image.asset(
                            notification.image,
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.bottomCenter,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 18, left: 10, right: 10),
                      child: Text(
                        notification.text,
                        style: TextStyle(),
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

class NotificationsListItem extends StatelessWidget {
  final NotificationModel notification;

  NotificationsListItem({Key key, this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      //leading: CircleAvatar(backgroundImage: new AssetImage(_notification.image)),
      leading: AspectRatio(
        aspectRatio: 1,
        child: Container(
            decoration: BoxDecoration(
                color: const Color(0xffe6eaf3),
                borderRadius: BorderRadius.circular(10)),
            child: new Image.asset(
              notification.image,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
            )),
      ),
      title: Text(notification.title,
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            notification.text,
            strutStyle: StrutStyle(leading: 0.5),
            style: Theme.of(context).textTheme.subtitle.copyWith(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            notification.date,
            strutStyle: StrutStyle(leading: 0.5),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
          )
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.keyboard_arrow_right,
            color: const Color(0xffcccccc),
          )
        ],
      ),
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => NotificationDetailPage(
        //               notification: notification,
        //             )));

        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              GestureDetector(
                  child: NotificationDetailPage(
                    notification: notification,
                  ),
                  onTap: () => Navigator.pop(context)),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.easeInOutCubic;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ));
      },
    );
  }
}

class NotificationList extends StatelessWidget {
  final List<NotificationModel> notifications;

  NotificationList({Key key, this.notifications, this.onChanged})
      : super(key: key);

  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   shrinkWrap: true,
    //   padding: EdgeInsets.symmetric(vertical: 8.0),
    //   children: _buildContactsList(),
    // );

    // List<NotificationsListItem> _buildContactsList() {
    //   return _notifications
    //       .map((contact) => NotificationsListItem(contact))
    //       .toList();
    // }

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final item = notifications[index];

        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: Key(item.title),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from the data source.
            // setState(() {
            //   items.removeAt(index);
            // });
            onChanged(index);

            // Then show a snackbar.
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text("${item.title} dismissed")));
          },
          // Show a red background as the item is swiped away.
          background: Container(color: Colors.red),
          child: NotificationsListItem(notification: item),
        );
      },
    );
  }
}

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<NotificationPage> {
  List<NotificationModel> notifications;

  _buildNotificationList() {
    return notificationsData;
  }

  _handleSwitchBoxLessChanged(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  void initState() {
    notifications = _buildNotificationList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              tooltip: "Add update",
              onPressed: () {
                setState(() {
                  notifications.add(NotificationModel(
                      "assets/Illustration1.png", "new title", "new text", ""));
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: "Settings",
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => SettingsPage()));

                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      GestureDetector(
                          child: SettingsPage(),
                          onTap: () => Navigator.pop(context)),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = Offset(1.0, 0.0);
                    var end = Offset.zero;
                    var curve = Curves.easeInOutCubic;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ));
              },
            ),
          ],
        ),
        body: Container(
          child: NotificationList(
              notifications: notifications,
              onChanged: _handleSwitchBoxLessChanged),
        ));
  }
}

class NotificationModel {
  String image;
  String title;
  String text;
  String date;

  NotificationModel(this.image, this.title, this.text, this.date);
}

List<NotificationModel> notificationsData = [
  NotificationModel(
      "assets/Illustration1.png",
      "Swiftui",
      "了解如何使用高级合成、布局、图形和动画在SwiftUI中构建自定义视图和控件看一个高性能的演示，可动画控制和观看它在代码中一步一步深入了解迅捷的布局体系",
      "JUN 26"),
  NotificationModel(
      "assets/Illustration2.png",
      "Framer X",
      "了解如何使用高级合成、布局、图形和动画在Framer X中构建自定义视图和控件看一个高性能的演示，可动画控制和观看它在代码中一步一步深入了解迅捷的布局体系",
      "JUN 26"),
  NotificationModel(
      "assets/Illustration3.png",
      "CSS Layout",
      "了解如何使用高级合成、布局、图形和动画在CSS中构建自定义视图和控件看一个高性能的演示，可动画控制和观看它在代码中一步一步深入了解迅捷的布局体系",
      "JUN 26"),
  NotificationModel(
      "assets/Illustration4.png",
      "React Native Part2",
      "了解如何使用高级合成、布局、图形和动画在React中构建自定义视图和控件看一个高性能的演示，可动画控制和观看它在代码中一步一步深入了解迅捷的布局体系",
      "JUN 26"),
  NotificationModel(
      "assets/Certificate1.png",
      "Unity",
      "了解如何使用高级合成、布局、图形和动画在Unity中构建自定义视图和控件看一个高性能的演示，可动画控制和观看它在代码中一步一步深入了解迅捷的布局体系",
      "JUN 26"),
  NotificationModel(
      "assets/Certificate2.png",
      "React Native for Designer",
      "了解如何使用高级合成、布局、图形和动画在React中构建自定义视图和控件看一个高性能的演示，可动画控制和观看它在代码中一步一步深入了解迅捷的布局体系",
      "JUN 26"),
  NotificationModel(
      "assets/Certificate3.png",
      "Vue",
      "了解如何使用高级合成、布局、图形和动画在Vue中构建自定义视图和控件看一个高性能的演示，可动画控制和观看它在代码中一步一步深入了解迅捷的布局体系",
      "JUN 26"),
  NotificationModel(
      "assets/Certificate4.png",
      "Angular",
      "了解如何使用高级合成、布局、图形和动画在Angular中构建自定义视图和控件看一个高性能的演示，可动画控制和观看它在代码中一步一步深入了解迅捷的布局体系",
      "JUN 26"),
];
