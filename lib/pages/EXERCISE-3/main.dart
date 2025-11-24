import 'package:flutter/material.dart';
import 'package:w8_practice/pages/EXERCISE-3/ui/screens/temperature_screen.dart';
import 'package:w8_practice/pages/EXERCISE-3/ui/screens/welcome_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isStarts = false;

  void onStarted(bool newValue) {
    setState(() {
      isStarts = newValue;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff16C062), Color(0xff00BCDC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: isStarts
            ? TemperatureScreen()
            : WelcomeScreen(onChanged: onStarted),
      ),
    );
  }
}
