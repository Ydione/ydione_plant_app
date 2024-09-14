import 'package:flutter/material.dart';
import 'package:ydione_plant_app/ui/onboarding_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnboardingScreen(),
      title: 'Onboarding Screen',
      debugShowCheckedModeBanner: false,
    );
  }
}
