import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  Color _getStatusColor(int score) {
    if (score <= 30) return Colors.green;
    if (score <= 40) return Colors.orange;
    if (score <= 50) return Colors.orange.shade700;
    return Colors.red;
  }

  String _getDetailedMessage(int score) {
    if (score <= 30) {
      return 'Based on your responses, your symptoms suggest a lower likelihood of PCOS. However, continue to monitor your health and consult a healthcare provider if you notice any changes.';
    } else if (score <= 40) {
      return 'Your symptoms indicate a possible presence of PCOS. We recommend discussing these symptoms with a healthcare provider for proper evaluation.';
    } else if (score <= 50) {
      return 'Your symptoms strongly suggest PCOS. It\'s important to schedule an appointment with a healthcare provider for a thorough evaluation and proper diagnosis.';
    } else {
      return 'Your symptoms require immediate attention. Please consult a healthcare provider as soon as possible for proper evaluation and care.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final int totalScore = ModalRoute.of(context)!.settings.arguments as int;
    String resultMessage = '';
    if (totalScore <= 30) {
      resultMessage = 'PCOS Unlikely';
    } else if (totalScore <= 40) {
      resultMessage = 'PCOS Somewhat Possible';
    } else if (totalScore <= 50) {
      resultMessage = 'PCOS Likely';
    } else {
      resultMessage = 'Consult a Doctor';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assessment Results',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Score Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      resultMessage,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _getStatusColor(totalScore),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(totalScore).withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Score: $totalScore',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: _getStatusColor(totalScore),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Detailed Message
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'What does this mean?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _getDetailedMessage(totalScore),
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Action Buttons
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/moreInfo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.black12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'More information',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              const SizedBox(height: 12),
              
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/questionnaire'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.black12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Retake Assessment',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}