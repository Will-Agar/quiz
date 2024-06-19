import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  int currrentQuestionIndx = 0;
  bool displayAnswers = false;

  answerQuestion(String answer) {
    widget.onSelectAnswer(answer);

    setState(() {
      currrentQuestionIndx++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currrentQuestionIndx];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          currentQuestion.question,
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 237, 179, 224),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        ...currentQuestion.getShuffledAnswers().map((String answer) {
          return AnswerButton(
            answer,
            () {
              answerQuestion(answer);
            },
          );
        }),
      ],
    );
  }
}
