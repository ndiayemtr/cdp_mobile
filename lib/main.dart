import 'package:cdp_mobile/actualites.dart';
import 'package:cdp_mobile/astuces_conseils.dart';
import 'package:cdp_mobile/deposer_plainte.dart';
import 'package:cdp_mobile/documentations.dart';
import 'package:cdp_mobile/faire_un_signalement.dart';
import 'package:cdp_mobile/menu_screen.dart';
import 'package:cdp_mobile/vue/missions/mission.dart';
import 'package:cdp_mobile/vue/missions/mission_cdp.dart';
import 'package:cdp_mobile/navigation_bar.dart';
import 'package:cdp_mobile/quiz.dart';
import 'package:flutter/material.dart';

import 'drawer_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CDP',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DrawerMenu(),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MenuScren(),
        );
      case '/mission':
        return MaterialPageRoute(
          builder: (context) => const MissionCdp(),
        );
      case '/documentation':
        return MaterialPageRoute(
          builder: (context) => const Documentations(),
        );
      case '/signalement':
        return MaterialPageRoute(
          builder: (context) => const FaireUnSignalement(),
        );
      case '/astucesetconseils':
        return MaterialPageRoute(
          builder: (context) => const AstucesConseils(),
        );
      case '/deposer_plainte':
        return MaterialPageRoute(
          builder: (context) => const DeposerPlainte(),
        );
      case '/quiz':
        return MaterialPageRoute(
          builder: (context) => const Quiz(),
        );
      case '/actualite':
        return MaterialPageRoute(
          builder: (context) => const Actuallite(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
          centerTitle: true,
        ),
        body: Center(
          child: Text("Page not found"),
        ),
      );
    });
  }
}
