import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CoinFlip());
  }
}

class CoinFlip extends StatefulWidget {
  const CoinFlip({super.key});

  @override
  CoinFlipState createState() => CoinFlipState();
}

class CoinFlipState extends State<CoinFlip> {
  int coinSide = 0;
  String result = '';

  void flipCoin() {
    setState(() {
      coinSide = Random().nextInt(2);
      result = coinSide == 0 ? 'Heads' : 'Tails';
      print('Coin side: $coinSide, Result: $result');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 182, 142),
      appBar: AppBar(title: const Text("Coin Flip")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              coinSide == 0
                  ? 'assets/images/bleu_head.jpg'
                  : 'assets/images/cat_back.jpg',
              width: 300,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: flipCoin,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 104, 131, 228),
                foregroundColor: const Color.fromARGB(255, 207, 46, 46),
              ),
              child: const Text(
                "Flip Coin",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              result,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
