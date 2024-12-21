// core/constants/question_bank.dart
import 'package:nova_pcos/models/questionnaire_model.dart';

final List<Question> pcosQuestions = [
  Question(
    questionText: 'Menstrual Irregularities',
    options: [
      AnswerOption(label: 'Regular periods (every 28-35 days)', points: 0),
      AnswerOption(
          label: 'Periods vary slightly in length (within 7 days)', points: 2),
      AnswerOption(
          label: 'Periods irregular (more than 7-day difference)', points: 3),
      AnswerOption(
          label: 'Periods occur less than 6 times per year', points: 4),
      AnswerOption(
          label: 'Periods occur less than 4 times per year', points: 5),
      AnswerOption(
          label: 'Periods occur less than 2 times per year', points: 6),
      AnswerOption(label: 'No periods for 3+ months', points: 7),
    ],
  ),
  Question(
    questionText: 'Acne',
    options: [
      AnswerOption(label: 'No acne or occasional breakouts', points: 0),
      AnswerOption(label: 'Rare breakouts', points: 2),
      AnswerOption(
          label: 'Occasional breakouts, especially around period', points: 3),
      AnswerOption(
          label: 'Breakouts occur sometimes but are manageable', points: 4),
      AnswerOption(label: 'Frequent breakouts', points: 5),
      AnswerOption(
          label: 'Breakouts are severe and require treatment', points: 6),
      AnswerOption(label: 'Severe and persistent acne', points: 7),
    ],
  ),
  Question(
    questionText: 'Weight Gain/Difficulty Losing Weight',
    options: [
      AnswerOption(label: 'Easy to maintain weight', points: 0),
      AnswerOption(label: 'Occasional weight fluctuations', points: 2),
      AnswerOption(
          label: 'Difficulty losing weight despite moderate effort', points: 4),
      AnswerOption(
          label: 'Difficulty losing weight despite diet and exercise',
          points: 5),
      AnswerOption(
          label: 'Significant weight gain or inability to lose weight',
          points: 6),
      AnswerOption(label: 'Intense weight gain', points: 7),
    ],
  ),
  Question(
    questionText: 'Excess Androgen Levels',
    options: [
      AnswerOption(label: 'No unwanted hair growth', points: 0),
      AnswerOption(label: 'Very occasional unwanted hair growth', points: 2),
      AnswerOption(label: 'Occasional unwanted hair growth', points: 3),
      AnswerOption(label: 'Noticeable unwanted hair growth', points: 4),
      AnswerOption(label: 'Significant unwanted hair growth', points: 5),
      AnswerOption(label: 'Persistent unwanted hair growth', points: 6),
      AnswerOption(label: 'Extensive unwanted hair growth', points: 7),
    ],
  ),
  Question(
    questionText: 'Thinning Hair or Hair Loss',
    options: [
      AnswerOption(label: 'No hair loss or thinning', points: 0),
      AnswerOption(
          label: 'Slight hair loss or barely noticeable thinning', points: 2),
      AnswerOption(label: 'Occasional hair loss or slight thinning', points: 3),
      AnswerOption(label: 'Noticeable hair loss or thinning', points: 4),
      AnswerOption(label: 'Significant hair loss or thinning', points: 5),
      AnswerOption(label: 'Severe hair loss', points: 6),
      AnswerOption(label: 'Bald patches', points: 7),
    ],
  ),
  Question(
    questionText: 'Darkening of Skin',
    options: [
      AnswerOption(label: 'No skin darkening', points: 0),
      AnswerOption(label: 'Slight skin darkening', points: 2),
      AnswerOption(label: 'Occasional skin darkening', points: 3),
      AnswerOption(label: 'Noticeable skin darkening', points: 4),
      AnswerOption(label: 'Significant skin darkening', points: 5),
      AnswerOption(label: 'Persistent skin darkening', points: 6),
      AnswerOption(label: 'Extensive skin darkening', points: 7),
    ],
  ),
  Question(
    questionText: 'Fatigue',
    options: [
      AnswerOption(label: 'No fatigue', points: 0),
      AnswerOption(label: 'Occasional fatigue', points: 2),
      AnswerOption(label: 'Frequent fatigue', points: 3),
      AnswerOption(label: 'Persistent fatigue', points: 4),
      AnswerOption(label: 'Severe fatigue', points: 5),
      AnswerOption(label: 'Chronic fatigue', points: 6),
      AnswerOption(label: 'Debilitating fatigue', points: 7),
    ],
  ),
];
