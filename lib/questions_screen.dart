import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.storeAnswer, {super.key});
  
  final void Function(String answer) storeAnswer;
  
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;

  answerClick(String answer){
    setState(() {
      questionIndex++;
    });
    widget.storeAnswer(answer);
  }
  @override
  Widget build(context) {
    final currentQuestion = questions[questionIndex];

    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.roboto(
                color: const Color(0xFFFAFAFA),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ...currentQuestion.getShuffledAnswer().map((answer) {
              return AnswerButton(answerText: answer, onTap: () => answerClick(answer));
            })
          ],
        ),
      ),
    );
  }
}
