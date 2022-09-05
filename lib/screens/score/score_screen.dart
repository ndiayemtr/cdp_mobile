import 'package:cdp_mobile/constants.dart';
import 'package:cdp_mobile/controllers/question_controller.dart';
import 'package:cdp_mobile/main.dart';
import 'package:cdp_mobile/quiz.dart';
import 'package:cdp_mobile/screens/quiz/quiz_screen.dart';
import 'package:cdp_mobile/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("icons/bg.svg", fit: BoxFit.fill),
          Expanded(
            child: Column(
              children: [
                Spacer(flex: 1),
                Text(
                  "Score",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: kSecondaryColor),
                ),
                //Spacer(),
                Text(
                  "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: kSecondaryColor),
                ),
                //Spacer(flex: 1),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black, // Background color
                          ),
                          icon: const Icon(Icons.restart_alt),
                          label: const Text('Redemarrer le quiz'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizScreen()),
                            );
                          },
                        ),
                        /* const SizedBox(
                          width: 10,
                        ), */
                        ElevatedButton.icon(
                          icon: const Icon(Icons.home_outlined),
                          label: const Text('Allez dans Accueil'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange, // Background color
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
