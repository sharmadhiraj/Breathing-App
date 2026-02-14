import 'package:flutter/material.dart';

void main() {
  runApp(const BreathingApp());
}

class BreathingApp extends StatelessWidget {
  const BreathingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BreathingApp",
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.teal)),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Breathing App")),
      body: Center(child: Text("WIP")),
    );
  }
}
