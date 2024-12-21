// models/questionnaire_model.dart
class Question {
  final String questionText;
  final List<AnswerOption> options;

  Question({
    required this.questionText,
    required this.options,
  });
}

class AnswerOption {
  final String label;
  final int points;

  AnswerOption({required this.label, required this.points});
}