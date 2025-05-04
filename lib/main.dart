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
  int _numberToGuess =
      Random().nextInt(100) + 1; // Random number between 1 and 100
  String? _message = '私が思い浮かべている数字はなんでしょうか(1~100)？';
  final TextEditingController _controller = TextEditingController();
  int _count = 0;

  void _guessNumber() {
    int? userGuess = int.tryParse(_controller.text);

    if (userGuess == null || userGuess <= 0 || userGuess > 100) {
      _message = '1~100の数字を入力してください';
      setState(() {
        _controller.clear();
      });
      return;
    } else if (userGuess == _numberToGuess) {
      _count++;
      _message = '「$userGuess」で正解です！{$_count} 回目で当たりました！新しい数字を思い浮かべます';
      _numberToGuess = Random().nextInt(100) + 1;
      _count = 0;
    } else if (userGuess > _numberToGuess) {
      _count++;
      _message = '「$userGuess」は大きすぎます！もう一度試してみてください！';
    } else if (userGuess < _numberToGuess) {
      _count++;
      _message = '「$userGuess」は小さすぎます！もう一度試してみてください！';
    }
    setState(() {
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("数字あてゲーム")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message!,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '1~100の数字を入力してください',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _guessNumber, child: const Text('答える')),
          ],
        ),
      ),
    );
  }
}
