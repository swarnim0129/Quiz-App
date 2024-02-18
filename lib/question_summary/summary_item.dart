import "package:adv_basics/question_summary/question_identifier.dart";
import "package:flutter/material.dart";

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrect: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(
          height: 20,
          width: 15,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemData['question'] as String,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              itemData['user_answer'] as String,
              style: const TextStyle(
                color: Color.fromARGB(255, 231, 250, 66),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              itemData['correct_answer'] as String,
              style: const TextStyle(
                color: Color.fromARGB(255, 11, 255, 19),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ))
      ],
    );
  }
}
