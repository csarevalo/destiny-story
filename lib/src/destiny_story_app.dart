import 'package:destiny_story/src/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DestinyStoryApp extends StatelessWidget {
  const DestinyStoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
