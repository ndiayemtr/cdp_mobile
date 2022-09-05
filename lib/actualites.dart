import 'package:cdp_mobile/data_actualites.dart';
import 'package:cdp_mobile/vue/actualites/actualite_detail.dart';
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
        //appBar: AppBar(),
        endDrawer: const Drawer(
          child: NavigationDrawer(),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Astuces & Conseils'),
        ),
        body: ListView.builder(
          itemCount: DATA_ACTUALITE.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(DATA_ACTUALITE[index].titre),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(DATA_ACTUALITE[index].imageUrl),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ActualiteDetail(
                            detailConseil: DATA_ACTUALITE[index],
                          )));
                },
              ),
            );
          },
        ));
  }
}
