import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/result_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.answers, this.resetQuiz, {super.key});

  final List<String> answers;
  final void Function() resetQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var x = 0; x < answers.length; x++) {
      summary.add(
        {
          'index': x,
          'question': questions[x].question,
          'correctAnswer': questions[x].answers[0],
          'chosenAnswer': answers[x],
          'correct': questions[x].answers[0] == answers[x]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return data['correct'] as bool;
    }).length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You have answered $correctQuestions out $totalQuestions questions correctly',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 237, 179, 224),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        ResultSummary(summaryData),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: resetQuiz,
          icon: const Icon(Icons.restart_alt),
          label: const Text('Restart Quiz!'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 38, 0, 46),
          ),
        )
      ],
    );
  }
}
