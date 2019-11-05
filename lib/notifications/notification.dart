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
      leading:
          CircleAvatar(backgroundImage: new AssetImage(_notification.image)),
      title: Text(_notification.title),
      subtitle: Text(_notification.text),
      trailing: Text(_notification.date),
    );
  }
}

class NotificationList extends StatelessWidget {
  final List<NotificationModel> _notifications;

  NotificationList(this._notifications);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
      "swiftui",
      "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会",
      "JUN 26"),
  NotificationModel(
      "assets/Illustration2.png",
      "swiftui",
      "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会",
      "JUN 26"),
  // Notification(
  //     "assets/Illustration3.png",
  //     "swiftui",
  //     "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会",
  //     "JUN 26"),
  // Notification(
  //     "assets/Illustration4.png",
  //     "swiftui",
  //     "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话��司工会",
  //     "JUN 26"),
  // Notification(
  //     "assets/Certificate1.png",
  //     "swiftui",
  //     "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧��是的归属感就是 属地化工is多个hi是个 是个hi第三���国会死哦低功耗is电话公司工会",
  //     "JUN 26"),
  // Notification(
  //     "assets/Certificate2.png",
  //     "swiftui",
  //     "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会",
  //     "JUN 26"),
  // Notification(
  //     "assets/Certificate3.png",
  //     "swiftui",
  //     "大家忽视覅偶���回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会",
  //     "JUN 26"),
];
