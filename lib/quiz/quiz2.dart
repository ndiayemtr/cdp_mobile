import 'package:cdp_mobile/quiz/answer.dart';
import 'package:cdp_mobile/quiz/questions.dart';
import 'package:flutter/material.dart';

class Quiz2 extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz2({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Question(
            questions[questionIndex]['questionText'].toString(),
          ), //Question
          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(() => answerQuestion(answer['score']),
                answer['text'].toString());
          }).toList()
        ],
      ),
    ); //Column
  }
}
