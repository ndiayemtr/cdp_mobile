import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonActionFloating extends StatelessWidget {
  const ButtonActionFloating({Key? key}) : super(key: key);

  void _launchUrl(String _url) async {
    if (!await launch(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
