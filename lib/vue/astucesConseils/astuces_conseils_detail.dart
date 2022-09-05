import 'package:cdp_mobile/astuces_conseils.dart';
import 'package:flutter/material.dart';

import '../../drawer_menu.dart';
import '../../models/model_astuces_conseils.dart';

class AstucesConseilsDetail extends StatelessWidget {
  final AstucesConseilsModel detailConseil;
  const AstucesConseilsDetail({Key? key, required this.detailConseil})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(
        child: NavigationDrawer(),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(detailConseil.titre),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                detailConseil.imageUrl,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                detailConseil.titre,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                detailConseil.description,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
      /*   body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                detailConseil.imageUrl,
                // height: 30,
              ),
            ),
            Spacer(),
            //Image.asset(detailConseil.imageUrl),
            Text(detailConseil.description),
          ],
        ),
      ), */
    );
  }
}
