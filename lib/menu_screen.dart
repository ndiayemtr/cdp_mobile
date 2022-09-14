import 'package:cdp_mobile/data_menu.dart';
import 'package:cdp_mobile/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'dart:io' show Platform;

import 'models/model_menu.dart';
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
            const SizedBox(height: 30),
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
            child: const Icon(FontAwesomeIcons.youtube),
            //backgroundColor: Colors.red,
            label: 'YouTube',
            onTap: () => _launchUrl(
                'https://www.youtube.com/channel/UC9nGZUKH2eWYFKurzIcbX6w'),
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.facebook),
            backgroundColor: Colors.blue,
            label: 'Facebook',
            onTap: () => _launchUrl('https://www.facebook.com/cdpsenegal/'),
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.twitter),
            backgroundColor: Colors.blue,
            label: 'Twitter',
            onTap: () => _launchUrl('https://twitter.com/cdpsenegal'),
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.linkedin),
            //backgroundColor: Colors.blue,
            label: 'Linkedin',
            onTap: () =>
                _launchUrl('https://www.linkedin.com/company/cdpsenegal/'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.mail),
            backgroundColor: Colors.orange,
            label: 'Email',
            onTap: () => _launchUrl('mailto:contact.cdp@cdp.sn'),
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.phone),
            backgroundColor: Colors.green,
            label: 'Appeler la CDP',
            onTap: () => _launchUrl('tel:+221-33-859-70-30'),
          ),
          SpeedDialChild(
            child: const Icon(FontAwesomeIcons.whatsapp),
            backgroundColor: Colors.green,
            label: 'Contacez nous par whatsapp',
            onTap: () {
              openwhatsapp();
            },
          ),
        ],
      ),
    );
  }

  openwhatsapp() async {
    /* var whatsapp = "+221771124640";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isMacOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("WhatsApp non installé")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("WhatsApp non installé")));
      }
    } */
    final link = WhatsAppUnilink(
      phoneNumber: '+221771124640',
      text: "Bonjour la CDP",
    );

    await launch('$link');
  }

  Widget gridViewSection = GridView.builder(
    itemCount: DATA_MENU.length,
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
                height: 130,
                width: 140,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.indigoAccent,
                      Colors.indigo,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(DATA_MENU[index].icon, color: Colors.white, size: 50),
                    //SizedBox(height: 5),
                    Text(
                      DATA_MENU[index].title,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
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
