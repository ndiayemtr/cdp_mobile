import 'dart:ui';

import 'package:cdp_mobile/vue/missions/mission_instruction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../drawer_menu.dart';

final _images = [
  'assets/cdp_cest_quoi.jpg',
  'assets/mission_de_veille.jpg',
  'assets/mission_de_veille.jpg',
  'assets/mission_instruction.jpg',
  'assets/mission_de_control.jpg',
];

class Mission extends StatefulWidget {
  const Mission({Key? key}) : super(key: key);

  @override
  State<Mission> createState() => _Missiontate();
}

class _Missiontate extends State<Mission> {
  List MISSION_VEILLE = [
    {
      'text': 'A ce titre, la CDP :',
    },
    {
      'text':
          '• Veille à ce que les traitements des données à caractère personnel soient mis en œuvre conformément aux dispositions légales ;',
    },
    {
      'text':
          '• informe les personnes concernées et les responsables de traitement de leurs droits et obligations ;',
    },
    {
      'text':
          '• s’assure que les Technologies de l’Information et de la Communication (TIC) ne comportent pas de menace au regard',
    },
    {
      'text':
          '• homologue les chartes d’utilisation présentées par des responsables de traitement de l’information ou de données;',
    },
    {
      'text':
          '• tient un répertoire des traitements des données à caractère personnel à la disposition du public ;',
    },
    {
      'text':
          '• conseille les personnes et organismes qui ont recours aux traitements des données à caractère personnel ou qui procèdent à des essais ou expériences de nature à aboutir à de tels traitements ;',
    },
    {
      'text':
          '• présente au gouvernement toute suggestion susceptible de simplifier et d’améliorer le cadre législatif et réglementaire à l’égard du traitement des données ;',
    },
    {
      'text':
          '• publie les autorisations accordées et les avis émis dans le répertoire des traitements des données à caractère personnel ;',
    },
    {
      'text':
          '• établit chaque année un rapport d’activités remis au Président de la République et au Président de l’Assemblée nationale ;',
    },
    {
      'text':
          '• formule toutes recommandations utiles en vue de veiller à ce que les traitements des données à caractère personnel soient mis en œuvre conformément aux dispositions en vigueur ;',
    },
    {
      'text':
          '• coopère avec les autorités de protection des données à caractère personnel des pays tiers et participe aux négociations internationales en matière de protection des données à caractère personnel.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(
        child: NavigationDrawer(),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
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
                "UNE MISSION DE VEILLE, DE SENSIBILISATION, DE CONSEILS ET DE PROPOSITIONS",
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
                children: MISSION_VEILLE.map(
                  (item) {
                    return Text(
                      item['text'],
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.justify,
                    );
                    const SizedBox(
                      height: 10,
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
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Background color
                    ),
                    icon: Icon(Icons.arrow_back),
                    label: Text(''),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton.icon(
                    icon: Icon(Icons.arrow_forward_rounded),
                    label: Text(''),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MissionInstruction()),
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
    );
  }

  Widget imgCdp = Image.asset(
    'assets/cdp.jpeg',
    height: 100,
    width: 400,
  );
}
