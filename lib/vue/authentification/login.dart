import 'dart:convert';

import 'package:cdp_mobile/drawer_menu.dart';
import 'package:cdp_mobile/models/user_modole.dart';
import 'package:cdp_mobile/vue/authentification/register.dart';
import 'package:cdp_mobile/widget/custom_testField.dart';
import 'package:cdp_mobile/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String err = '';
  bool _loading = false;
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
    setState(() {
      err = "";
      _loading = true;
    });
    String urlConnection =
        "https://cdpmobile.000webhostapp.com/mobile/login.php";
    final response = await http.post(Uri.parse(urlConnection),
        body: {"email": email, "password": passsword});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      int success = data['data'][1];
      _loading = false;
      if (success == 1) {
        setState(() {
          err = data['data'][0];
          UserModel.saveUser(UserModel.fromJson(data['data'][2]));
          _loading = false;
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const DrawerMenu(),
          ),
        );
      } else {
        setState(() {
          err = data['data'][0];
          _loading = false;
        });
      }
    }
  }

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    emailtext.err = 'Entrez un email';
    passText.err = 'Entrez un mot de passe';
    return _loading
        ? const Loading()
        : Scaffold(
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
                            if (_key.currentState!.validate()) {
                              login(emailtext.value, passText.value);
                            }
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

  Widget imgCdp = Image.asset(
    'assets/cdp.jpeg',
  );
}
