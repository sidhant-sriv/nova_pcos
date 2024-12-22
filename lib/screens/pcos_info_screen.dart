import 'package:flutter/material.dart';

class PcosInfoFaqScreen extends StatelessWidget {
  const PcosInfoFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PCOS Info & FAQs'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Section: What is PCOS?
          Text(
            'What is PCOS?',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Polycystic Ovary Syndrome (PCOS) is a hormonal disorder affecting '
            'women of reproductive age. It impacts the ovaries, often leading to '
            'irregular periods, weight gain, excessive hair growth, and hormonal '
            'imbalances. PCOS is also linked to insulin resistance, which can '
            'increase the risk of diabetes and other health complications. Early '
            'diagnosis and lifestyle management can greatly improve quality of life.',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24),

          // Section: FAQs About PCOS Causes
          Text(
            'FAQs About PCOS Causes',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16),

          // FAQ #1
          _buildFaqItem(
            context,
            question: 'What causes PCOS?',
            answer:
                'The exact cause of PCOS is unknown, but it involves a combination of '
                'genetic, hormonal, and lifestyle factors.',
          ),
          const SizedBox(height: 16),

          // FAQ #2
          _buildFaqItem(
            context,
            question: 'How does insulin resistance impact PCOS?',
            answer:
                'Insulin resistance causes the body to produce more insulin, which '
                'can lead to weight gain and excess androgen production.',
          ),
          const SizedBox(height: 16),

          // FAQ #3
          _buildFaqItem(
            context,
            question: 'Is PCOS hereditary?',
            answer:
                'Yes, PCOS can run in families, indicating a genetic component.',
          ),
          const SizedBox(height: 16),

          // FAQ #4
          _buildFaqItem(
            context,
            question: 'Can stress cause PCOS?',
            answer:
                'Stress does not directly cause PCOS but can worsen symptoms by '
                'affecting hormone balance.',
          ),
          const SizedBox(height: 16),

          // FAQ #5
          _buildFaqItem(
            context,
            question: 'What role does diet play in PCOS?',
            answer:
                'A diet high in refined sugars and carbohydrates can worsen insulin '
                'resistance and PCOS symptoms.',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  /// A helper function for displaying a Question & Answer block
  Widget _buildFaqItem(
    BuildContext context, {
    required String question,
    required String answer,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          answer,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
