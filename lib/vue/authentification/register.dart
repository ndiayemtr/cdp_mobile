import 'dart:convert';

import 'package:cdp_mobile/vue/authentification/login.dart';
import 'package:cdp_mobile/widget/custom_testField.dart';
import 'package:cdp_mobile/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String err = '';
  bool _loading = false;

  void inscription(
      String prenom, String nom, String email, String passsword) async {
    setState(() {
      err = "";
      _loading = true;
    });
    String urlConnection =
        "https://cdpmobile.000webhostapp.com/mobile/inscription.php";
    final response = await http.post(Uri.parse(urlConnection), body: {
      'prenom': prenom,
      'nom': nom,
      'email': email,
      'password': passsword
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int success = data['data'][1];
      print(data['data'][0]);
      _loading = false;
      if (success == 1) {
        setState(() {
          err = data['data'][0];
          //print(err);
          _loading = false;
        });
      } else {
        setState(() {
          err = data['data'][0];
          //print(err);
          _loading = false;
        });
      }
    }
  }

  CustomTestField emailtext = new CustomTestField(
    title: 'Email',
    placeholder: 'example@cdp.sn',
  );
  CustomTestField prenomText = new CustomTestField(
    title: 'Prénom',
    placeholder: 'Fatima',
  );
  CustomTestField nomText = new CustomTestField(
    title: 'Nom',
    placeholder: 'Fall',
  );
  CustomTestField passText = new CustomTestField(
    title: 'mot de passe',
    placeholder: '***********',
    ispass: true,
  );
  CustomTestField confPassText = new CustomTestField(
    title: 'confirmez mot de passe',
    placeholder: '***********',
    ispass: true,
  );

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    emailtext.err = 'Entrez un email';
    prenomText.err = 'Entrez un email';
    nomText.err = 'Entrez un email';
    passText.err = 'Entrez un mot de passe';
    return _loading
        ? const Loading()
        : Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Inscription",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        prenomText.textFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        nomText.textFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        emailtext.textFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        passText.textFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        confPassText.textFormField(),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              if (passText.value == confPassText.value) {
                                inscription(prenomText.value, nomText.value,
                                    emailtext.value, passText.value);
                              } else {
                                print('mot de passe incorect');
                                print(passText.value);
                                print(confPassText.value);
                              }
                            }
                          },
                          child: const Text(
                            "S'inscrire",
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orangeAccent.withOpacity(.7),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Avez-vous un compte? '),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()),
                                );
                              },
                              child: const Text(
                                'Se connecter',
                                style: TextStyle(color: Colors.orangeAccent),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          err,
                          style: TextStyle(
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
