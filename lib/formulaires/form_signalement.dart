import 'package:background_sms/background_sms.dart';
import 'package:cdp_mobile/api/api.dart';
import 'package:cdp_mobile/models/signalement.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mailer/mailer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class SignalementForm extends StatefulWidget {
  const SignalementForm({Key? key}) : super(key: key);

  @override
  State<SignalementForm> createState() => _SignalementFormState();
}

class _SignalementFormState extends State<SignalementForm> {
  /*  add() async {
    await APi.addSignalement();
  } */

  final formkey =
      GlobalKey<FormState>(); // Permet de valider les champs de saisi

  final prenomController = TextEditingController();
  final nomController = TextEditingController();
  final telController = TextEditingController();
  final objetController = TextEditingController();
  final messageController = TextEditingController();

  bool signal = false;

  List<String> smsTraitementSignal = ["221771124640"];

  @override
  void dispose() {
    prenomController.dispose();
    nomController.dispose();
    telController.dispose();
    objetController.dispose();
    messageController.dispose();
    super.dispose();
  }

  static const platform = const MethodChannel('sendSms');

  Future sendEmail() async {
    final email = 'ndiayemtr@gmail.com';
    final smtpServer = gmail('ndiayemtr@gmail.com', 'yxbjfszadugvsjhz');

    final message = Message()
      ..from = Address(email, 'Matar')
      ..recipients = ['ndiayemtr@gmail.com', 'matar.ndiaye@cdp.sn']
      ..subject = 'Bonjour Matar'
      ..text = 'Nouveau siganlement recu';

    try {
      await send(message, smtpServer);
    } on MailerException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faire un signalement'),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: prenomController,
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Donnez un prenom';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: nomController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Donnez un Nom';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: telController,
                decoration: const InputDecoration(
                  labelText: 'Numero Téléphone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Donnre un Numero de Téléphone ';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: objetController,
                decoration: const InputDecoration(
                  labelText: 'Objet',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Objet de la plainte ';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
              child: TextFormField(
                controller: messageController,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 5,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Donnez un message';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Center(
              child: ElevatedButton(
                onPressed: signal
                    ? null
                    : () async {
                        if (formkey.currentState!.validate()) {
                          setState(() {
                            signal = true;
                          });
                          Signalement signalement = new Signalement(
                            prenom: prenomController.text,
                            nom: nomController.text,
                            telephone: telController.text,
                            objet: objetController.text,
                            message_signalement: messageController.text,
                          );

                          var result =
                              await APi.addSignalement(signalement.toMap());

                          if (result != null && result[0]) {
                            setState(() {
                              signal = false;
                            });
                            sendEmail();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    new Text("Votre signalement est envoyé")));

                            Navigator.of(context).pop();
                          } else if (result != null && !result[0]) {
                            setState(() {
                              signal = false;
                            });
                          } else {
                            setState(() {
                              signal = false;
                            });
                          }
                        }
                      },
                child: const Text('Deposer le signalement'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
