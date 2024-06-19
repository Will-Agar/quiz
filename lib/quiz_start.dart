import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizStart extends StatelessWidget {
  const QuizStart(this.start, {super.key});

  final void Function() start;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(40),
          child: Image.asset(
            'assets/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 179, 224),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.arrow_right_alt),
          onPressed: start,
          label: const Text('Start Quiz'),
        )
      ],
    );
  }
}
