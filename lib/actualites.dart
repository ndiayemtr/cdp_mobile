import 'package:flutter/material.dart';

class Actuallite extends StatefulWidget {
  const Actuallite({Key? key}) : super(key: key);

  @override
  State<Actuallite> createState() => _ActualliteState();
}

class _ActualliteState extends State<Actuallite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Page Actualité',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {}, child: Text("Aller ala page mission")),
        ],
      ),
    );
  }
}
