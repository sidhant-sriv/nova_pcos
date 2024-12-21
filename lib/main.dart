import 'package:flutter/material.dart';
import 'package:nova_pcos/resources.dart';
import 'package:nova_pcos/screens/contact.dart';
import 'package:nova_pcos/screens/moreinfo/more_information_screen.dart';
import 'package:nova_pcos/screens/results/results.dart';
import 'package:nova_pcos/screens/welcome/welcome.dart';
import 'package:nova_pcos/screens/questionnaire/questionnaire_screen.dart';

void main() {
  runApp(const PCOSApp());
}

class PCOSApp extends StatelessWidget {
  const PCOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PCOS Symptom Assessment',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFFA73358, {
          50: Color.fromARGB(255, 248, 215, 225),
          100: Color.fromARGB(255, 241, 176, 196),
          200: Color.fromARGB(255, 234, 136, 166),
          300: Color.fromARGB(255, 227, 97, 137),
          400: Color.fromARGB(255, 220, 57, 107),
          500: Color.fromARGB(255, 167, 51, 88),
          600: Color.fromARGB(255, 134, 41, 70),
          700: Color.fromARGB(255, 100, 31, 53),
          800: Color.fromARGB(255, 67, 21, 35),
          900: Color.fromARGB(255, 33, 10, 18),
        }),
        fontFamily: 'Proxima Nova',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        // '/register': (context) => const RegistrationScreen(),
        // '/login': (context) => const LoginScreen(),
        '/questionnaire': (context) => const QuestionnaireScreen(),
        '/results': (context) => const ResultsScreen(),
        '/moreInfo': (context) => const MoreInformationScreen(),
        '/contact': (context) => const ContactUsScreen(),
        '/pcosResources': (context) => const PcosResourcesScreen(),
        //TODO: Add routes for other screens
        '/register': (context) => const Placeholder(),
        '/login': (context) => const Placeholder(),

        '/about': (context) => const Placeholder(),
      },
    );
  }
}
