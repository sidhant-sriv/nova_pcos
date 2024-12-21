import 'package:flutter/material.dart';

class PcosResourcesScreen extends StatelessWidget {
  const PcosResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PCOS Resources')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        physics: const ClampingScrollPhysics(),
        children: [
          // Title
          const Text(
            'PCOS Resources',
          ),
          const SizedBox(height: 16),

          // SECTION 1: Support Organizations
          _buildSectionTitle(context, 'Support Organizations'),
          const _ResourceCard(
            title: 'PCOS Society of India',
            websiteLabel: 'PCOS Society India',
            websiteUrl: 'https://pcossocietyindia.org/',
            focusText: 'Education, research, and awareness campaigns.',
          ),
          const _ResourceCard(
            title: 'PCOS Challenge',
            websiteLabel: 'PCOS Challenge',
            websiteUrl: 'https://pcoschallenge.org/',
            focusText:
                'Global support network, webinars, and awareness programs.',
          ),
          const SizedBox(height: 24),

          // SECTION 2: Healthcare Providers
          _buildSectionTitle(context, 'Healthcare Providers'),
          const _ResourceCard(
            title: 'Nova Fertility',
            websiteLabel: 'Nova Fertility India',
            websiteUrl: 'https://www.novafertility.com/',
            focusText: 'Specialized care for PCOS-related infertility.',
          ),
          const _ResourceCard(
            title: 'All India Institute of Medical Sciences (AIIMS)',
            websiteLabel: 'AIIMS Locations',
            websiteUrl: 'https://www.aiims.edu/en.html',
            focusText: 'Comprehensive PCOS diagnosis and treatment.',
          ),
          const SizedBox(height: 24),

          // SECTION 3: Online Resources
          _buildSectionTitle(context, 'Online Resources'),
          const _ResourceCard(
            title: 'PCOS Awareness Association',
            websiteLabel: 'PCOS Awareness Association',
            websiteUrl: 'https://www.pcosaa.org/',
            focusText:
                'Informational articles, symptom trackers, and community forums.',
          ),
          const _ResourceCard(
            title: 'Mayo Clinic',
            websiteLabel: 'Mayo Clinic - PCOS',
            websiteUrl: 'https://www.mayoclinic.org/diseases-conditions/pcos',
            focusText:
                'Trusted medical advice and research-backed PCOS information.',
          ),
          const SizedBox(height: 24),

          // SECTION 4: Nutrition and Fitness
          _buildSectionTitle(context, 'Nutrition and Fitness'),
          const _ResourceItem(
            label: 'Dietary Guidelines for PCOS',
            focusText:
                'Low-glycemic index diets, balanced nutrition, and meal plans.',
          ),
          const _ResourceItem(
            label: 'Fitness Programs',
            focusText: 'Yoga, pilates, and PCOS-specific exercise routines.',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  /// A helper widget to render each section title with consistent styling
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }
}

class _ResourceCard extends StatelessWidget {
  final String title;
  final String websiteLabel;
  final String websiteUrl;
  final String focusText;

  const _ResourceCard({
    required this.title,
    required this.websiteLabel,
    required this.websiteUrl,
    required this.focusText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(top: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          // Since we're removing both url_launcher and WebView,
          // simply show a SnackBar with the URL.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('URL: $websiteUrl'),
            ),
          );
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Resource Title
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // "Link" label (no actual opening)
              Text(
                websiteLabel,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 8),

              // Focus Description
              Text(
                'Focus: $focusText',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A simpler resource item without a website link
class _ResourceItem extends StatelessWidget {
  final String label;
  final String focusText;

  const _ResourceItem({
    required this.label,
    required this.focusText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item Label
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),

          // Focus Description
          Text(
            'Focus: $focusText',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
