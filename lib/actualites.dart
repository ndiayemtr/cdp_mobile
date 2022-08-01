import 'package:flutter/material.dart';

import 'drawer_menu.dart';

class Actuallite extends StatefulWidget {
  const Actuallite({Key? key}) : super(key: key);

  @override
  State<Actuallite> createState() => _ActualliteState();
}

class _ActualliteState extends State<Actuallite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(
        child: NavigationDrawer(),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Page Actualité',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
