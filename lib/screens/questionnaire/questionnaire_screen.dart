import 'package:flutter/material.dart';
import 'package:nova_pcos/constants/question_bank.dart';
import 'package:nova_pcos/models/questionnaire_model.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  int currentIndex = 0;
  List<int?> selectedAnswers = List.filled(pcosQuestions.length, null);

  // A simple progress calculation
  double get progress => (currentIndex + 1) / pcosQuestions.length;

  void _onNext() {
    if (currentIndex < pcosQuestions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      // Reached the last question, let's calculate score
      _calculateResults();
    }
  }

  void _onPrevious() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  void _calculateResults() {
    int totalScore = 0;
    for (int i = 0; i < pcosQuestions.length; i++) {
      final selected = selectedAnswers[i];
      if (selected != null) {
        totalScore += pcosQuestions[i].options[selected].points;
      }
    }
    Navigator.pushNamed(
      context,
      '/results',
      arguments: totalScore,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion = pcosQuestions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('PCOS Assessment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Progress bar
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 20),
            Text(
              'Question ${currentIndex + 1}/${pcosQuestions.length}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Question
            Text(
              currentQuestion.questionText,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Options
            for (int i = 0; i < currentQuestion.options.length; i++)
              RadioListTile<int>(
                title: Text(currentQuestion.options[i].label),
                value: i,
                groupValue: selectedAnswers[currentIndex],
                onChanged: (value) {
                  setState(() {
                    selectedAnswers[currentIndex] = value;
                  });
                },
              ),

            const Spacer(),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: currentIndex > 0,
                  child: OutlinedButton(
                    onPressed: _onPrevious,
                    child: const Text('Previous'),
                  ),
                ),
                ElevatedButton(
                  onPressed: selectedAnswers[currentIndex] == null
                      ? null
                      : _onNext, // disable if no option selected
                  child: Text(
                    currentIndex < pcosQuestions.length - 1
                        ? 'Next'
                        : 'Submit Assessment',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
