import 'package:flutter/material.dart';
import 'package:fluttersatrtup/components/drawer_tile.dart';
import 'package:fluttersatrtup/pages/filter_page.dart';
import 'package:fluttersatrtup/pages/messsage_page.dart';
import 'package:fluttersatrtup/pages/portfolio_page.dart';
import 'package:fluttersatrtup/pages/profile_page.dart';
import 'package:fluttersatrtup/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: ,
      child: Column(
        children: <Widget>[
          DrawerHeader(child: Icon(Icons.face)),
          //profile title
          DrawerTitle(
            title: "profile",
            leading: Icon(Icons.account_circle),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ));
            },
          ),
          //portfolio title
          DrawerTitle(
            title: "portfolio",
            leading: Icon(Icons.shopping_bag),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PortfolioPage(),
                  ));
            },
          ),
          //setting title
          DrawerTitle(
              title: "Setting",
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingPage(),
                    ));
              }),
          //message title
          DrawerTitle(
            title: "Message",
            leading: Icon(Icons.message),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => messagepage(),
                  ));
            },
          ),
          // filtter title
          DrawerTitle(
            title: "Filter",
            leading: Icon(Icons.filter_list),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
