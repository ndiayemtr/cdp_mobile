import 'package:flutter/cupertino.dart';
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
    return Container(
      child: Text("deposer_plainte"),
    );
  }
}
