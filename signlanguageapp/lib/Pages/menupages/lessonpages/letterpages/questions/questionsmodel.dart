class Question {
  final String question;
  final List<String> options;
  final String correctAnswerIndex;
  final String imageString;

  const Question({
    required this.correctAnswerIndex,
    required this.imageString,
    required this.question,
    required this.options,
  });
}