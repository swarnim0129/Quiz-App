import "package:adv_basics/question.dart";
import "package:adv_basics/questions_screen.dart";
import "package:flutter/material.dart";
import 'package:adv_basics/start_screen.dart';
import "package:adv_basics/result_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;           first way
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);

  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionsScreen();
  //   });
  // }

  List<String> selectedAnswers = [];
  var activeScreen = "start_screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions_screen";
    });
  }

  void chooseAnswers(answers) {
    selectedAnswers.add(answers);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result_screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions_screen") {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswers);
    }

    if (activeScreen == "result_screen") {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Color.fromARGB(255, 114, 116, 255),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget),
      ),
    );
  }
}
