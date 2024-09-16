import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  var currentScreen = 'start-screen';

  void changeScreen(){
    setState(() {
      currentScreen = 'question-screen';
    });
  }

  @override
  Widget build(context){

    Widget screenDisplayed = StartScreen(changeScreen);
    if (currentScreen == 'question-screen'){
      screenDisplayed = const QuestionsScreen();
    }


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 36, 236, 50),
                Color.fromARGB(255, 29, 101, 244),
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