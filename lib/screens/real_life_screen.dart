import 'package:flutter/material.dart';

class RealLifeStoriesScreen extends StatelessWidget {
  const RealLifeStoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // A list of stories for demonstration
    final List<_PcosStory> stories = [
      _PcosStory(
        nameAndAge: 'Ayesha Dutt, 23, Kolkata',
        details:
            'Ayesha experiences continuous menstrual bleeding, leading to debilitating cramps, low blood pressure, and fainting spells. This condition has heightened her anxiety and affected her professional relationships due to mood swings.',
        source: 'Homegrown',
      ),
      _PcosStory(
        nameAndAge: 'Nayanika, 22',
        details:
            'Nayanika has faced body shaming and bullying because of weight gain, acne, and hair loss associated with PCOS. These experiences have led to poor mental health, including mood swings and sudden emotionality.',
        source: 'Homegrown',
      ),
      _PcosStory(
        nameAndAge: 'Sarah Patil, 20, Mumbai',
        details:
            'Sarah developed an eating disorder after her PCOS diagnosis, resorting to starvation and experiencing borderline bulimia. This struggle resulted in significant emotional distress and harmful behaviors.',
        source: 'Homegrown',
      ),
      _PcosStory(
        nameAndAge: 'Rujvi Mehta, 22, Gujarat',
        details:
            'Rujvi deals with excessive hair growth on her chin, cheeks, stomach, and back, impacting her self-esteem and causing anxiety about visiting salons for hair removal.',
        source: 'Homegrown',
      ),
      _PcosStory(
        nameAndAge: 'Anamika Sharma, 16',
        details:
            'Anamika began missing periods at 16, accompanied by severe skin breakouts and rapid weight gain. She faced dismissive attitudes from healthcare providers, with some assuming pregnancy or downplaying her symptoms as typical PMS.',
        source: 'TweakIndia',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Real Stories of Women Facing PCOS Challenges'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        physics: const ClampingScrollPhysics(), // or BouncingScrollPhysics()
        children: [
          // Optional header or subtitle
          // You can remove this if you only want the title from the AppBar.
          Text(
            'Read these personal experiences to better understand the challenges and triumphs of living with PCOS.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 16),

          // Build each story card
          for (final story in stories) _StoryCard(story: story),

          // A bit of space before the button
          const SizedBox(height: 24),

          // "Share Your Story" Button
          ElevatedButton(
            onPressed: () {
              // Example: Navigator.pushNamed(context, '/shareStory');
            },
            child: const Text('Share Your Story'),
          ),
        ],
      ),
    );
  }
}

/// A simple model class to hold story data.
class _PcosStory {
  final String nameAndAge;
  final String details;
  final String source;

  _PcosStory({
    required this.nameAndAge,
    required this.details,
    required this.source,
  });
}

/// A reusable card widget to display each story.
/// Similar in style to your "Resources" cards.
class _StoryCard extends StatelessWidget {
  final _PcosStory story;

  const _StoryCard({required this.story});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Story Title (name & age)
            Text(
              story.nameAndAge,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Story Details
            Text(
              story.details,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade800,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 8),

            // Source label
            Text(
              'Source: ${story.source}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
