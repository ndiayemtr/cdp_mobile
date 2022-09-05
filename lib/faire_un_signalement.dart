import 'package:cdp_mobile/models/signalement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'formulaires/form_signalement.dart';

class FaireUnSignalement extends StatefulWidget {
  const FaireUnSignalement({Key? key}) : super(key: key);

  @override
  State<FaireUnSignalement> createState() => _FaireUnSignalementState();
}

class _FaireUnSignalementState extends State<FaireUnSignalement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SignalementForm(),
    );
  }
}
