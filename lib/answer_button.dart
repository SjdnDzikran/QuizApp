import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(125, 255, 193, 7),
        foregroundColor: Colors.white,
      ),
      child: Text(answerText),
    );
  }
}
