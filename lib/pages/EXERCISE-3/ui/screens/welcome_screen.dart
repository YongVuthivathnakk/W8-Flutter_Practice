import 'package:flutter/material.dart';
import 'package:w8_practice/pages/EXERCISE-3/ui/screens/temperature_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final isStarted = false;
  final ValueChanged<bool> onChanged;

  const WelcomeScreen({super.key, required this.onChanged});

  void handleTap() {
    onChanged(!isStarted);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
          ),
          const Text(
            "Welcome !",
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
          const SizedBox(height: 15),
          OutlinedButton(
            onPressed: () {
              handleTap();
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.0, color: Colors.white),
            ),
            child: const Text(
              'Start to convert',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
