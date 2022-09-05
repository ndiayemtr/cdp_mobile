import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignalementForm extends StatefulWidget {
  const SignalementForm({Key? key}) : super(key: key);

  @override
  State<SignalementForm> createState() => _SignalementFormState();
}

class _SignalementFormState extends State<SignalementForm> {
  final formkey =
      GlobalKey<FormState>(); // Permet de valider les champs de saisi
  final prenomController = TextEditingController();
  final nomController = TextEditingController();
  final villeController = TextEditingController();
  final motifController = TextEditingController();
  final telController = TextEditingController();
  final emailController = TextEditingController();
  final objetController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    prenomController.dispose();
    nomController.dispose();
    villeController.dispose();
    telController.dispose();
    emailController.dispose();
    objetController.dispose();
    messageController.dispose();
    super.dispose();
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
                controller: motifController,
                decoration: const InputDecoration(
                  labelText: 'Motif de la plainte',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Motif de la plainte ';
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
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    print(prenomController);
                    print(nomController);
                    print(messageController);
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
