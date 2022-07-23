import 'package:flutter/material.dart';

class Mission extends StatefulWidget {
  const Mission({Key? key}) : super(key: key);

  @override
  State<Mission> createState() => _Missiontate();
}

class _Missiontate extends State<Mission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Page Mission',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {}, child: Text("Aller ala page actualite")),
        ],
      ),
    );
  }
}
