// core/constants/question_bank.dart
import 'package:nova_pcos/models/questionnaire_model.dart';

final List<Question> pcosQuestions = [
  Question(
    questionText: 'Menstrual Irregularities',
    options: [
      AnswerOption(label: 'Regular periods (every 28-35 days)', points: 0),
      AnswerOption(label: 'Periods vary slightly in length (within 7 days)', points: 2),
      AnswerOption(label: 'Periods irregular (more than 7-day difference)', points: 3),
      AnswerOption(label: 'Periods occur less than 6 times per year', points: 4),
      AnswerOption(label: 'Periods occur less than 4 times per year', points: 5),
      AnswerOption(label: 'Periods occur less than 2 times per year', points: 6),
      AnswerOption(label: 'No periods for 3+ months', points: 7),
    ],
  ),
  Question(
    questionText: 'Acne',
    options: [
      AnswerOption(label: 'No acne or occasional breakouts', points: 0),
      AnswerOption(label: 'Rare breakouts', points: 2),
      AnswerOption(label: 'Occasional breakouts, especially around period', points: 3),
      AnswerOption(label: 'Breakouts occur sometimes but are manageable', points: 4),
      AnswerOption(label: 'Frequent breakouts', points: 5),
      AnswerOption(label: 'Breakouts are severe and require treatment', points: 6),
      AnswerOption(label: 'Severe and persistent acne', points: 7),
    ],
  ),
  
];