import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> chosenAnswer = [];
  var currentScreen = 'start-screen';

  void changeScreen() {
    setState(() {
      currentScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    chosenAnswer.add(answer);

    if (chosenAnswer.length == questions.length) {
      setState(() {
        currentScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      chosenAnswer = [];
      currentScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenDisplayed = StartScreen(changeScreen);
    if (currentScreen == 'question-screen') {
      screenDisplayed = QuestionsScreen(chooseAnswer);
    }
    if (currentScreen == 'results-screen') {
      screenDisplayed = ResultsScreen(
        chosenAnswer: chosenAnswer,
        restart: restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF21212B),
                Color(0xFF2C3E50),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenDisplayed,
        ),
      ),
    );
  }
}
