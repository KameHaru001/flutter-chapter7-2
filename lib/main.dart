import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chapter7-2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const NumberGuessGame(),
    );
  }
}

class NumberGuessGame extends StatefulWidget {
  const NumberGuessGame({super.key});

  @override
  State<NumberGuessGame> createState() => _NumberGuessGameState();
}

class _NumberGuessGameState extends State<NumberGuessGame> {
  int _NumberToGuess =
      Random().nextInt(100) + 1; // Random number between 1 and 100
  String? _message = '私が思い浮かべている数字はなんでしょうか(1~100)？';
  final TextEditingController _controller = TextEditingController();
  int _count = 0;

  void _guessNumber() {
    int? userGuess = int.tryParse(_controller.text);

    if (userGuess == null || userGuess <= 0 || userGuess > 100) {
      _message = "1~100の数字を入力してください";
      setState(() {
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
