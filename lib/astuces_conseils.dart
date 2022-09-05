import 'package:cdp_mobile/data_astuce_conseils.dart';
import 'package:cdp_mobile/vue/astucesConseils/astuces_conseils_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'drawer_menu.dart';

class AstucesConseils extends StatefulWidget {
  const AstucesConseils({Key? key}) : super(key: key);

  @override
  State<AstucesConseils> createState() => _AstucesConseilsState();
}

class _AstucesConseilsState extends State<AstucesConseils> {
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
          itemCount: DATA_ASTUCE_CONSEILS.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(DATA_ASTUCE_CONSEILS[index].titre),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(DATA_ASTUCE_CONSEILS[index].imageUrl),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AstucesConseilsDetail(
                            detailConseil: DATA_ASTUCE_CONSEILS[index],
                          )));
                },
              ),
            );
          },
        ));
  }
}
