import 'package:flutter/material.dart';
import 'package:w8_practice/pages/EXERCISE-1/ex_1_start.dart';
import 'package:w8_practice/pages/EXERCISE-2/ui/screens/profile.dart';
import 'package:w8_practice/pages/EXERCISE-3/main.dart';
import 'package:w8_practice/pages/EXERCISE-4/data/jokes.dart';
import 'package:w8_practice/pages/EXERCISE-4/exercise4.dart';
import 'pages/EXERCISE-2/data/profile_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: Exercise4(jokesData: dadJokes),
    );
  }
}
