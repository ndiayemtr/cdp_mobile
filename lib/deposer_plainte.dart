import 'package:cdp_mobile/formulaires/form_deposer_plainte.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DeposerPlainte extends StatefulWidget {
  const DeposerPlainte({Key? key}) : super(key: key);

  @override
  State<DeposerPlainte> createState() => _DeposerPlainteState();
}

class _DeposerPlainteState extends State<DeposerPlainte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: DeposerPlaintForm(),
    );
  }
}
