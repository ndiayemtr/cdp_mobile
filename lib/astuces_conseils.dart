import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AstucesConseils extends StatefulWidget {
  const AstucesConseils({Key? key}) : super(key: key);

  @override
  State<AstucesConseils> createState() => _AstucesConseilsState();
}

class _AstucesConseilsState extends State<AstucesConseils> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("AstucesConseils"),
    );
  }
}
