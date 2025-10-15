import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreInformationScreen extends StatelessWidget {
  const MoreInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Adjust these routes to match your app's named routes
    const String contactUsRoute = '/contact';
    const String pcosInfoRoute = '/pcosResources';
    const String aboutUsUrl = 'https://www.novaivffertility.com/about-pcos-app';
    // New routes added for demonstration
    const String pcosFaqsRoute = '/pcosFaqs';
    const String realLifeStoriesRoute = '/realLifeStories';

    return Scaffold(
      appBar: AppBar(
        title: const Text('More Information'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        children: [
          // Optional header/introduction
          const Text(
            'Need some help or want to learn more?\nWe’ve got you covered.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          _InfoCard(
            icon: Icons.support_agent,
            title: 'Contact Us',
            description: 'Reach out for support, guidance, or questions.',
            onTap: () => Navigator.pushNamed(context, contactUsRoute),
          ),
          const SizedBox(height: 12),

          _InfoCard(
            icon: Icons.info_outline,
            title: 'PCOS Info',
            description: 'Learn more about PCOS, its causes, and treatments.',
            onTap: () => Navigator.pushNamed(context, pcosInfoRoute),
          ),
          const SizedBox(height: 12),

          _InfoCard(
            icon: Icons.people_outline,
            title: 'About Us',
            description:
                'Learn more about the PCOS app and Nova IVF Fertility.',
            onTap: () => _launchExternalURL(aboutUsUrl),
          ),
          const SizedBox(height: 12),

          // NEW BUTTON: PCOS Information and FAQs
          _InfoCard(
            icon: Icons.question_answer,
            title: 'PCOS Information & FAQs',
            description: 'Common questions and detailed answers about PCOS.',
            onTap: () => Navigator.pushNamed(context, pcosFaqsRoute),
          ),
          const SizedBox(height: 12),

          // NEW BUTTON: Real Life Stories
          _InfoCard(
            icon: Icons.favorite_outline,
            title: 'Real Life Stories',
            description: 'Inspirational journeys and success stories.',
            onTap: () => Navigator.pushNamed(context, realLifeStoriesRoute),
          ),
        ],
      ),
    );
  }

  Future<void> _launchExternalURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // Fallback for web - just open in same tab
      await launchUrl(url, mode: LaunchMode.platformDefault);
    }
  }
}

/// A reusable card widget for each info item.
class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Using InkWell to provide a tap ripple effect
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // Card-like design
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Leading icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: .1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(width: 16),

            // Title + Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),

            // Trailing arrow
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
