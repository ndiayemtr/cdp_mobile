import 'package:flutter/material.dart';

class Voir extends StatefulWidget {
  // const voir({Key? key}) : super(key: key);

  @override
  State<Voir> createState() => _VoirState();
}

class _VoirState extends State<Voir> {
  List<BottomNavigationBarItem> items = [];
  int id = 0;
  String value = '';

  @override
  void initState() {
    items = [];
    items.add(BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
        color: Colors.purple,
      ),
      label: 'Person',
    ));
    items.add(BottomNavigationBarItem(
      icon: Icon(
        Icons.wallpaper,
        color: Colors.purple,
      ),
      label: 'Credit',
    ));
    items.add(BottomNavigationBarItem(
      icon: Icon(
        Icons.add_shopping_cart,
        color: Colors.purple,
      ),
      label: 'Shopping',
    ));
    items.add(BottomNavigationBarItem(
      icon: Icon(
        Icons.airport_shuttle,
        color: Colors.purple,
      ),
      label: 'Voiture',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: id,
        onTap: null,
      ),
    );
  }
}
