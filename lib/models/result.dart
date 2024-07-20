class Result {
  final int questionIndex;
  final String question;
  final String answer;
  final String correctAnswer;
  final bool isCorrect;

  Result({
    required this.questionIndex,
    required this.question,
    required this.answer,
    required this.correctAnswer,
    required this.isCorrect,
  });
}
