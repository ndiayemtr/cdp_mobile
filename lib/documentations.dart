import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Documentations extends StatefulWidget {
  const Documentations({Key? key}) : super(key: key);

  @override
  State<Documentations> createState() => _DocumentationsState();
}

class _DocumentationsState extends State<Documentations> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("Documentations"),
    );
  }
}
