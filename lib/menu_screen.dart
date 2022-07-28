import 'package:cdp_mobile/data_menu.dart';
import 'package:cdp_mobile/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/model_menu.dart';
import 'navigation_bar.dart';

//final Uri _url = Uri.parse('https://flutter.dev');

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

  void _launchUrl(String _url) async {
    if (!await launch(_url)) {
      throw 'Could not launch $_url';
    }
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
            child: Icon(FontAwesomeIcons.youtube),
            backgroundColor: Colors.red,
            label: 'YouTube',
            onTap: () => _launchUrl('https://www.youtube.com'),
          ),
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.facebook),
            backgroundColor: Colors.blue,
            label: 'Facebook',
            onTap: () => _launchUrl('https://www.facebook.com'),
          ),
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.twitter),
            backgroundColor: Colors.blue,
            label: 'Twitter',
            onTap: () => _launchUrl('https://www.twitter.com'),
          ),
          SpeedDialChild(
            child: Icon(Icons.mail),
            backgroundColor: Colors.orange,
            label: 'Email',
            onTap: () => _launchUrl('mailto:ndiayemtr@gmail.com'),
          ),
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.phone),
            backgroundColor: Colors.green,
            label: 'Appeler la CDP',
            onTap: () => _launchUrl('tel:+221-77-112-46-40'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: id,
          onTap: _navigateBotonBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper), label: 'Actualite'),
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
