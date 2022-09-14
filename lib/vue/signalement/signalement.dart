import 'dart:convert';

import 'package:cdp_mobile/vue/authentification/login.dart';
import 'package:cdp_mobile/widget/custom_testField.dart';
import 'package:cdp_mobile/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Signalment extends StatefulWidget {
  const Signalment({Key? key}) : super(key: key);

  @override
  State<Signalment> createState() => _SignalmentState();
}

class _SignalmentState extends State<Signalment> {
  String err = '';
  bool _loading = false;

  void inscription(String prenom, String nom, String tel, String objet,
      String message) async {
    setState(() {
      err = "";
      _loading = true;
    });
    String urlConnection =
        "https://cdpmobile.000webhostapp.com/mobile/signalement.php";
    final response = await http.post(Uri.parse(urlConnection), body: {
      'prenom': prenom,
      'nom': nom,
      'telephone': tel,
      'objet': objet,
      'message': message
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int success = data['data'][1];
      print(data['data'][0]);
      _loading = false;
      if (success == true) {
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

  CustomTestField objet = new CustomTestField(
    title: 'Objet',
    placeholder: 'objet du signalement',
  );
  CustomTestField prenom = new CustomTestField(
    title: 'Prénom',
    placeholder: 'Fatima',
  );
  CustomTestField nom = new CustomTestField(
    title: 'Nom',
    placeholder: 'Fall',
  );
  CustomTestField tel = new CustomTestField(
    title: 'Tétéphone',
    placeholder: '77 111 11 11',
  );
  CustomTestField message = new CustomTestField(
    title: 'Votre message',
    placeholder: 'écrire le message',
    ispass: true,
  );

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    prenom.err = 'Entrez un email';
    nom.err = 'Entrez un nom';
    objet.err = 'Entrez un objet';
    tel.err = 'Entrez un numero téléphone';
    message.err = 'Entrez le message';
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
                        prenom.textFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        nom.textFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        nom.textFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        tel.textFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        objet.textFormField(),
                        const SizedBox(
                          height: 10,
                        ),
                        message.textFormField(),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              inscription(prenom.value, nom.value, tel.value,
                                  objet.value, message.value);
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
