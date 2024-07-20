class Question {
  final String question;
  final List<String> answers;

  const Question({
    required this.question,
    required this.answers,
  });

  List<String> getShuffledAnswers() {
    final List<String> shuffledAnswers = List<String>.from(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
