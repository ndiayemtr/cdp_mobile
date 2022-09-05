import 'package:cdp_mobile/actualites.dart';
import 'package:cdp_mobile/astuces_conseils.dart';
import 'package:cdp_mobile/deposer_plainte.dart';
import 'package:cdp_mobile/documentations.dart';
import 'package:cdp_mobile/faire_un_signalement.dart';
import 'package:cdp_mobile/menu_screen.dart';
import 'package:cdp_mobile/vue/authentification/login.dart';
import 'package:cdp_mobile/vue/missions/mission.dart';
import 'package:cdp_mobile/vue/missions/mission_cdp.dart';
import 'package:cdp_mobile/navigation_bar.dart';
import 'package:cdp_mobile/quiz.dart';
import 'package:cdp_mobile/whatsapp.dart';
import 'package:flutter/material.dart';

import 'drawer_menu.dart';
import 'models/user_modole.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // This widget is the root of your application.
  bool login = false;
  isconnected() async {
    UserModel.getUser();
    if (UserModel.sessionUser.id == '') {
      setState(() {
        login = false;
      });
    } else {
      setState(() {
        login = true;
      });
    }
    print('id: ${UserModel.sessionUser.id}');
    print(login);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //isconnected();
  }

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
      //home: login ? const DrawerMenu() : const Login(),
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
      case '/whatsapp':
        return MaterialPageRoute(
          builder: (context) => const Whatsapp(),
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
          builder: (context) => Quiz(),
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
          title: const Text('Error'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("Page not found"),
        ),
      );
    });
  }
}
