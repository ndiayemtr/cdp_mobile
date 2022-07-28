import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class MissionControl extends StatefulWidget {
  const MissionControl({Key? key}) : super(key: key);

  @override
  State<MissionControl> createState() => _MissionControltate();
}

class _MissionControltate extends State<MissionControl> {
  List MISSION_CONTROL = [
    {
      'text': 'A ce titre, la CDP :',
    },
    {
      'text':
          '• informe sans délai le procureur de la République des infractions dont elle a connaissance ;',
    },
    {
      'text':
          '• peut charger un ou plusieurs de ses membres ou des agents de ses services de procéder à des vérifications portant sur tout traitement et, le cas échéant, d’obtenir des copies de tout document ou support d’information utile à sa mission ;',
    },
    {
      'text': '• répond à toute demande d’avis ;',
    },
    {
      'text':
          '• peut prononcer une sanction à l’égard d’un responsable de traitement.',
    },
  ];
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
              title: Text('Mission'),
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
                "UNE MISSION DE CONTROLE ET D’INVESTIGATION",
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
                children: MISSION_CONTROL.map(
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
                  /*  ElevatedButton.icon(
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
                  ), */
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
