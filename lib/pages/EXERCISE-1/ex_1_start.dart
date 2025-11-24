import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  List<Widget> getLables() {
    return colors.map((color) => Text(color)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Label("Method 1: Loop in Array", bold: true),
            for (var i = 0; i < colors.length; i++) Label(colors[i]),
            Label("Method 2: Map", bold: true),
            ...colors.map((color) => Label(color)),
            Label("Method 23: Dedicated Function", bold: true),
            ...getLables(),
          ],
        ),
      ),
    );
    ;
  }
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
