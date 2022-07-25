import 'package:flutter/material.dart';

import 'menu_screen.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Container(
        color: Colors.white,
        width: 250,
        child: ListView(
          //padding: EdgeInsets.only(top: 100),
          children: [
            ListTile(
              title: Text('MISSIONS'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('PLAITE'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('SIGNALEMENT'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: MenuScren(),
          ),
        ],
      ),
    );
  }
}
