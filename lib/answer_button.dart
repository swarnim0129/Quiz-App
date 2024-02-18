import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  final void Function() onTap;
  final String answerText;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: const Color.fromARGB(255, 224, 241, 255),
            foregroundColor: Colors.black),
        onPressed: onTap,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
