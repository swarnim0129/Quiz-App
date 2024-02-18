import "package:adv_basics/answer_button.dart";
import "package:adv_basics/question.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void changeQuestion(answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double
          .infinity, //this is used to center the text horizontlly and it means that take as much width it requires
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //the ...{spread operator} is used to convert the list to the
            // string because the children dosent accept another list inside
            //the childrens list so it needs to be converted to string seperated by ,
            ...currentQuestion.getShuffledList().map(
              (answer) {
                //map is a list method which is used to iterate over the list
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    changeQuestion(answer);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
