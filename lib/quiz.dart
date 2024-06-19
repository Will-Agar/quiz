import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/quiz_start.dart';
import 'package:quiz/results_screen.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainWidgetState();
  }
}

class _MainWidgetState extends State<MainWidget> {
  String activeScreen = 'start';
  List<String> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
  }

  void switchScreen(String screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreenWidget;

    if (activeScreen == 'start') {
      activeScreenWidget = QuizStart(() {
        switchScreen('questions');
      });
    } else if (activeScreen == 'questions') {
      activeScreenWidget = Questions(chooseAnswer);
    } else {
      activeScreenWidget = ResultsScreen(List.of(selectedAnswers), () {
        switchScreen('start');
      });
      selectedAnswers = [];
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 133, 2, 111),
                Color.fromARGB(255, 41, 0, 34),
              ],
            ),
          ),
          child: activeScreenWidget,
        ),
      ),
    );
  }
}
