import "package:adv_basics/question.dart";
import "package:flutter/material.dart";
import 'package:adv_basics/question_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});
  final void Function() restartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summarydata = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summarydata.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length; //returns the length of the matched condition into the variable
    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "you got $numCorrectQuestions ans out of $numTotalQuestions questions correctly",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summarydata),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                onPressed: restartQuiz,
                icon: const Icon(Icons.refresh),
                label: const Text(
                  "Restart Quiz",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )),
    );
  }
}
