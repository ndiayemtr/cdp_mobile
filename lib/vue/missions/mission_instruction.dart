import 'package:cdp_mobile/vue/missions/mission_control.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../drawer_menu.dart';

class MissionInstruction extends StatefulWidget {
  const MissionInstruction({Key? key}) : super(key: key);

  @override
  State<MissionInstruction> createState() => _MissionInstructiontate();
}

class _MissionInstructiontate extends State<MissionInstruction> {
  List MISSION_INSTRUCTION = [
    {
      'text': 'A ce titre, la CDP :',
    },
    {
      'text':
          '• reçoit les formalités préalables (les déclarations, les demandes d’autorisation) à la création de traitements des données à caractère personnel ;',
    },
    {
      'text':
          '• reçoit les réclamations, les pétitions et les plaintes relatives à la mise en œuvre des traitements des données à caractère personnel et informe leurs auteurs des suites données à celles-ci ;',
    },
    {
      'text': '• répond à toute demande d’avis ;',
    },
    {
      'text':
          '• autorise les transferts transfrontaliers de données à caractère personnel.',
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
                "UNE MISSION D’INSTRUCTION DES DOSSIERS",
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
                children: MISSION_INSTRUCTION.map(
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
                            builder: (context) => const MissionControl()),
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
