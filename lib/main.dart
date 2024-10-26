import 'package:flutter/material.dart';

void main() {
  runApp(const DestinyStoryApp());
}

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
      home: const Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/imgs/background.png',
              ),
            ),
          ),
          child: Center(
            child: Text('Hello World!'),
          ),
        ),
      ),
    );
  }
}
