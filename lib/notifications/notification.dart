import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  NotificationView({Key key, this.notification}) : super(key: key);
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(top: 18, left: 10, right: 10, bottom: 20),
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
                        "assets/Background.png",
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
    );
  }
}

class NotificationsListItem extends StatelessWidget {
  final NotificationModel _notification;

  NotificationsListItem(this._notification);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //leading: CircleAvatar(backgroundImage: new AssetImage(_notification.image)),
      leading: AspectRatio(
        aspectRatio: 1,
        child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xffe6eaf3),
              //borderRadius: BorderRadius.circular(20)
            ),
            child: new Image.asset(
              _notification.image,
              fit: BoxFit.fill,
            )),
      ),
      title: Text(_notification.title,
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _notification.text,
            strutStyle: StrutStyle(leading: 0.5),
            style: Theme.of(context).textTheme.subtitle.copyWith(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            _notification.date,
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
    );
  }
}

class NotificationList extends StatelessWidget {
  final List<NotificationModel> _notifications;

  NotificationList(this._notifications);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: _buildContactsList(),
    );
  }

  List<NotificationsListItem> _buildContactsList() {
    return _notifications
        .map((contact) => NotificationsListItem(contact))
        .toList();
  }
}

class NotificationPage extends StatelessWidget {
  _buildNotificationList() {
    return notifications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Notifications"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              tooltip: "Add update",
              onPressed: () {
                print("Alarm");
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: "Settings",
              onPressed: () {
                print("Alarm");
              },
            ),
          ],
        ),
        body: Container(
          child: NotificationList(_buildNotificationList()),
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

List<NotificationModel> notifications = [
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
      "swiftui",
      "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会",
      "JUN 26"),
];
