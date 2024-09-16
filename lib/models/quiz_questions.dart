class QuizQuestions{
  const QuizQuestions(this.question, this.answers);

  final String question;
  final List<String> answers;
  
  List<String> getShuffledAnswer(){
    final shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}