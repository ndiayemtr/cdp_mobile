import 'dart:convert';

import 'package:cdp_mobile/drawer_menu.dart';
import 'package:cdp_mobile/vue/authentification/register.dart';
import 'package:cdp_mobile/widget/custom_testField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  CustomTestField emailtext = new CustomTestField(
    title: 'Email',
    placeholder: 'example@cdp.sn',
  );

  CustomTestField passText = new CustomTestField(
    title: 'Password',
    placeholder: '***********',
    ispass: true,
  );

  void login(String email, String passsword) async {
    String url_connection =
        "https://cdpmobile.000webhostapp.com/mobile/connection.php";
    final response = await http.get(Uri.parse(url_connection));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    }
  }

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    emailtext.err = 'Entrez un email';
    passText.err = 'Entrez un mot de passe';
    return Scaffold(
      endDrawer: const Drawer(
        child: NavigationDrawer(),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //const SizedBox(height: 5),
                  imgCdp,
                  const SizedBox(
                      // height: 10,
                      ),
                  const Text(
                    "Se connecter",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  emailtext.textFormField(),
                  const SizedBox(
                    height: 10,
                  ),
                  passText.textFormField(),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      login("", "");
                      //if (_key.currentState!.validate()) {}
                    },
                    child: const Text(
                      'Se connecter',
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
                                builder: (context) => const Register()),
                          );
                        },
                        child: const Text(
                          'Inscription',
                          style: TextStyle(color: Colors.orangeAccent),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imgCdp = Image.asset(
    'assets/cdp.jpeg',
  );
}
