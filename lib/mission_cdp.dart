import 'package:cdp_mobile/drawer_menu.dart';
import 'package:cdp_mobile/menu_screen.dart';
import 'package:cdp_mobile/mission.dart';
import 'package:cdp_mobile/mission_instruction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'main.dart';

class MissionCdp extends StatefulWidget {
  const MissionCdp({Key? key}) : super(key: key);

  @override
  State<MissionCdp> createState() => _MissionCdptate();
}

class _MissionCdptate extends State<MissionCdp> {
  List MISSION_C_QUOI = [
    {
      'titre': 'Autorité Administrative Indépendante',
      'text':
          'La Commission de Protection des Données Personnelles (CDP) est une Autorité Administrative Indépendante (AAI) instituée par la loi n° 2008-12 du 25 janvier 2008 portant sur la protection des données à caractère personnel.',
    },
    {
      'titre': 'Régulatrice de l\'usage des données personnelles',
      'text':
          "En tant qu'autorité de régulation, la CDP autorise et encadre les traitements de données à caractère personnel. Elle rend des avis sur tout projet d'acte réglementaire portant création de traitements automatisés d'informations nominatives opérés pour le compte de l'Etat et de ses démembrements.",
    },
    {
      'titre': '	Contrôle et sanctions',
      'text':
          "La CDP agit au nom de l'État sans être sous sa tutelle. Elle dispose également de pouvoirs de contrôle et de sanction.",
    },
  ];

  void _navigateBotonBar(int index) {
    setState(() {
      id = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
        break;
    }
  }

  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlueAccent,
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
              title: Text('PLAINTE'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            imgCdp,
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "La CDP, c'est quoi ?",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: MISSION_C_QUOI.map(
                  (item) {
                    return Column(
                      children: [
                        Text(
                          item['titre'],
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          item['text'],
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.arrow_forward_rounded),
                    label: Text(''),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mission()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Background color
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: id,
          onTap: _navigateBotonBar,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper), label: 'Actualite'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Quiz'),
          ]),
    );
  }

  Widget imgCdp = Image.asset(
    'assets/cdp.jpeg',
    height: 100,
    width: 400,
  );
}
