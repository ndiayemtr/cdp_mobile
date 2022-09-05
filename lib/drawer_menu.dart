// ignore_for_file: deprecated_member_use

import 'package:cdp_mobile/data_menu.dart';
import 'package:cdp_mobile/main.dart';
import 'package:cdp_mobile/models/user_modole.dart';
import 'package:cdp_mobile/vue/authentification/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      appBar: AppBar(
          /*  actions: [
          IconButton(
            onPressed: () {
              UserModel.getUser();
              UserModel.logOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
            icon: const Icon(FontAwesomeIcons.signOutAlt),
          )
        ], */
          ),
      drawer: const NavigationDrawer(),
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

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.blue.shade700,
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 52,
              backgroundImage: AssetImage(
                'assets/cdp.jpeg',
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Amina',
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Text(
              'Amina@cdp.sn',
              style: TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        ),
      );

  Widget buildItems(BuildContext contex) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: DATA_MENU.map((item) {
            return ListTile(
              onTap: () {
                Navigator.pop(contex);
                Navigator.pushNamed(
                  contex,
                  '/${item.url}',
                );
              },
              leading: Icon(
                item.icon,
                size: 25,
              ),
              title: Text(
                item.title,
              ),
            );
          }).toList(),
        ),
      );
}
