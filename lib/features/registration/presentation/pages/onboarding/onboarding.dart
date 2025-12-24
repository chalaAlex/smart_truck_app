import 'package:flutter/material.dart';
import 'package:smart_truck_app/core/resources/string_manager.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [Center(child: Text(StringManager.role, style: TextStyle(),))]),
      ),
    );
  }
}
