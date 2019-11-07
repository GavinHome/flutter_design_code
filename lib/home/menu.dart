import 'package:flutter/material.dart';
import 'package:flutter_design_code/notifications/notification.dart';
import 'package:flutter_design_code/settings/settings.dart';

class MenuItem extends StatelessWidget {
  final MenuModel menu;

  MenuItem({Key key, this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (menu.title == "My Account!") {
      return DrawerHeader(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: new AssetImage("assets/Certificate4.png"),
              radius: 35,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Design Code",
                style: Theme.of(context).textTheme.title.copyWith(),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      );
    } else {
      return ListTile(
        leading: Icon(menu.icon),
        title: Text(menu.title),
        onTap: () {
          if (menu.title == "Settings") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
          }
          if (menu.title == "Notifications") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationPage()));
          }
        },
      );
    }
  }
}

class MenuView extends StatelessWidget {
  final List<MenuModel> menus;

  MenuView({Key key, this.menus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MenuItem> _buildMenuList() {
      return menus.map((item) => MenuItem(menu: item)).toList();
    }

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: _buildMenuList(),
    );
  }
}

class MenusPage extends StatelessWidget {
  MenusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: MenuView(menus: menuData),
    ));
  }
}

class MenuModel {
  String title;
  IconData icon;

  MenuModel({this.title, this.icon});
}

List<MenuModel> menuData = [
  MenuModel(title: "My Account!", icon: Icons.group),
  MenuModel(title: "Billing", icon: Icons.credit_card),
  MenuModel(title: "Notifications", icon: Icons.notifications),
  MenuModel(title: "Settings", icon: Icons.settings),
  MenuModel(title: "Sign out", icon: Icons.outlined_flag),
];
