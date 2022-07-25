import 'package:cdp_mobile/actualites.dart';
import 'package:cdp_mobile/menu_screen.dart';
import 'package:cdp_mobile/mission.dart';
import 'package:cdp_mobile/navigation_bar.dart';
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
      home: DrawerMenu(),
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
          builder: (context) => Mission(),
        );
      case '/actualite':
        return MaterialPageRoute(
          builder: (context) => Actuallite(),
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
