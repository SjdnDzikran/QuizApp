import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.restart,
    required this.chosenAnswer,
  });

  final void Function() restart;
  final List<String> chosenAnswer;

  List<Map<String, Object>> getResults() {
    final List<Map<String, Object>> results = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      results.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'choosen_answer': chosenAnswer[i]
      });
    }
    return results;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getResults();
    final numberOfQuestions = questions.length;
    final numberOfCorrectAnswers = summaryData.where((data) {
      return data['choosen_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numberOfCorrectAnswers out of $numberOfQuestions questions correctly',
              style: GoogleFonts.roboto(
                color: Color(0xFFFAFAFA),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Summary(summaryData),
            TextButton.icon(
              onPressed: restart,
              icon: const Icon(
                Icons.restart_alt_rounded,
                color: Color(0xFFFAFAFA),
              ),
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.roboto(
                  color: const Color(0xFFFAFAFA),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
