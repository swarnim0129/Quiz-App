import "package:flutter/material.dart";
// import 'package:adv_basics/questions_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startScreen, {super.key});
  final void Function() startScreen;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(        this is the first way of adding transparency to the image
          //   opacity: 0.5,
          //   child: Image.asset(
          //     "assets/images/quiz-logo.png",
          //     width: 300,
          //   ),
          // ),
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(129, 255, 255, 255),
            //this is the second way of adding transparency to the image by using the color slider
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Learn Flutter in fun way!!!",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 173, 181),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: startScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
