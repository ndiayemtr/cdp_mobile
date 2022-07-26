import 'package:flutter/material.dart';

class CustomTestField {
  final String title;
  final String placeholder;
  final bool ispass;
  //final int line;
  String err;
  String _value = '';

  CustomTestField({
    this.title = "",
    this.placeholder = '',
    this.ispass = false,
    this.err = "veillez remplir ce champ",
    //this.line = 10,
  });
  TextEditingController controller = new TextEditingController();

  TextFormField textFormField() {
    return TextFormField(
      controller: controller,
     // maxLength: this.line,
      onChanged: (e) {
        _value = e;
      },
      validator: (e) {
        return e!.isEmpty ? this.err : null;
      },
      obscureText: this.ispass,
      decoration: InputDecoration(
        hintText: this.placeholder,
        labelText: this.title,
        labelStyle: TextStyle(color: Colors.orange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
          ),
        ),
      ),
    );
  }

  String get value {
    return _value;
  }
}
