import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String fullName = '';
  String emailAddress = '';
  String phoneNumber = '';
  String message = '';

  // Replace with your actual Apps Script URL
  final String googleScriptUrl =
      'https://script.google.com/macros/s/AKfycbxCsYp4lKKMLXHuBhLc_DctA8TXFyeF3E8QbGF0nHFA0-pG5AEWZdXFbbo30Is2YY3hGA/exec';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1) Contact Information
              _buildContactInformation(),
              const SizedBox(height: 24),

              // 2) Query Submission Form
              _buildQuerySubmissionForm(),
              const SizedBox(height: 24),

              // 3) Support Availability
              _buildSupportAvailability(),
              const SizedBox(height: 24),

              // 4) Social Media Links
              _buildSocialMediaLinks(),
              const SizedBox(height: 24),

              // Button: Back to Home
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to More Information'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInformation() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nova Fertility'),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.phone, size: 20),
                SizedBox(width: 8),
                Text('+91 1800 200 0005'),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.email, size: 20),
                SizedBox(width: 8),
                Flexible(
                  child: Text('info@novafertility.com'),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.language, size: 20),
                SizedBox(width: 8),
                Flexible(
                  child: Text('Nova Fertility India'),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Nova Fertility Center, 3rd Floor, Metro Square Building, '
                    'Sector 9, Gurugram, India - 122001',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuerySubmissionForm() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Submit Your Query'),
              const SizedBox(height: 16),

              // Full Name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onSaved: (value) => fullName = value ?? '',
              ),
              const SizedBox(height: 12),

              // Email Address
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Basic pattern check
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) => emailAddress = value ?? '',
              ),
              const SizedBox(height: 12),

              // Phone Number (Optional)
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number (Optional)',
                ),
                onSaved: (value) => phoneNumber = value ?? '',
              ),
              const SizedBox(height: 12),

              // Message
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Message/Query',
                  alignLabelWithHint: true,
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your message or query';
                  }
                  return null;
                },
                onSaved: (value) => message = value ?? '',
              ),
              const SizedBox(height: 16),

              // Submit Query Button
              ElevatedButton(
                onPressed: _submitQuery,
                child: const Text('Submit Query'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSupportAvailability() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.access_time, size: 28, color: Colors.blueAccent),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'Our team is available Monday to Friday, 9 AM to 6 PM IST, '
                'to answer your queries. Expect a response within 24-48 hours.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaLinks() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Connect with Us',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            _SocialMediaRow(
              icon: Icons.facebook,
              label: 'Facebook',
              text: 'PCOS Support India',
              onTap: () {},
            ),
            _SocialMediaRow(
              icon: Icons.camera_alt_outlined,
              label: 'Instagram',
              text: '@pcosappindia',
              onTap: () {},
            ),
            _SocialMediaRow(
              icon: Icons.alternate_email,
              label: 'Twitter',
              text: '@PCOSIndia',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  // Method that sends data to your Apps Script
  Future<void> _submitQuery() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Show a loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      try {
        // Prepare form data
        final Map<String, String> formData = {
          'fullName': fullName,
          'emailAddress': emailAddress,
          'phoneNumber': phoneNumber,
          'message': message,
        };

        // Send data to the Google Apps Script
        final response = await http.post(
          Uri.parse(googleScriptUrl),
          body: formData,
        );

        // Close the loading dialog
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();

        if (response.statusCode == 200) {
          // Show success message
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Your query has been submitted successfully!'),
            ),
          );
          // Reset the form
          _formKey.currentState!.reset();
        } else {
          // Show error message
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text(
          //       'Error ${response.statusCode}: Could not submit your query.',
          //     ),
          //   ),
          // );
        }
      } catch (e) {
        Navigator.of(context).pop(); // Close loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Submission failed: $e'),
          ),
        );
      }
    }
  }
}

/// A reusable row for each social media item
class _SocialMediaRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String text;
  final VoidCallback? onTap;

  const _SocialMediaRow({
    required this.icon,
    required this.label,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.blueAccent),
            const SizedBox(width: 16),
            Text(
              '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
