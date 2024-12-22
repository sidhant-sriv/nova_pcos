import 'package:flutter/material.dart';
import 'package:nova_pcos/resources.dart';
import 'package:nova_pcos/screens/contact.dart';
import 'package:nova_pcos/screens/moreinfo/more_information_screen.dart';
import 'package:nova_pcos/screens/pcos_info_screen.dart';
import 'package:nova_pcos/screens/real_life_screen.dart';
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
        primarySwatch: const Color.fromARGB(255, 163, 13, 61),
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
        '/pcosFaqs': (context) => const PcosInfoFaqScreen(),
        '/realLifeStories': (context) => const RealLifeStoriesScreen(),
        //TODO: Add routes for other screens

        '/about': (context) => const Placeholder(),
      },
    );
  }
}
