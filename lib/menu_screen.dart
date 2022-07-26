import 'package:cdp_mobile/data_menu.dart';
import 'package:cdp_mobile/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'model/model_menu.dart';
import 'navigation_bar.dart';

class MenuScren extends StatefulWidget {
  @override
  State<MenuScren> createState() => _MenuScrenState();
}

class _MenuScrenState extends State<MenuScren> {
  //const MenuScrenn({Key? key}) : super(key: key);
  int id = 0;
  String slongantCdp =
      'S’assurer que tout ce qui permet d’identifier une personne physique soit sécurisé et confidentie';

  void _navigateBotonBar(int index) {
    setState(() {
      id = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 5),
            imgCdp,
            Text(
              slongantCdp,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Expanded(
              flex: 1,
              child: gridViewSection,
            )
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.orange,
        overlayColor: Colors.grey,
        overlayOpacity: 0.5,
        spaceBetweenChildren: 12,
        closeManually: true,
        spacing: 15,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.share_rounded,
            ),
            backgroundColor: Colors.orange,
            label: 'youTube',
            onTap: () {},
          ),
          SpeedDialChild(
            child: Icon(
              Icons.mail,
            ),
            backgroundColor: Colors.orange,
            label: 'tiwer',
          ),
          SpeedDialChild(
            child: Icon(
              Icons.copy,
            ),
            backgroundColor: Colors.orange,
            label: 'facebook',
          ),
          SpeedDialChild(
            child: Icon(
              Icons.ac_unit_outlined,
            ),
            backgroundColor: Colors.orange,
            label: 'linkedin',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: id,
          onTap: _navigateBotonBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Actualite'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Quiz'),
          ]),
    );
  }

  Widget gridViewSection = GridView.builder(
    itemCount: DATA_MENU.length,
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    itemBuilder: (BuildContext ctx, index) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            ctx,
            '/${DATA_MENU[index].url}',
          );
        },
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  DATA_MENU[index].icon,
                  color: Colors.white,
                  size: 45,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                DATA_MENU[index].title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },
  );

  Widget imgCdp = Image.asset(
    'assets/cdp.jpeg',
    height: 230,
    width: 400,
  );
}
