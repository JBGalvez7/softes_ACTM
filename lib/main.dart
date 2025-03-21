import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CoinFlip(),
    );
  }
}

class CoinFlip extends StatefulWidget {
  const CoinFlip({super.key});

  @override
  CoinFlipState createState() => CoinFlipState();
}

class CoinFlipState extends State<CoinFlip> {
  int coinSide = 0;
  String result = 'Tap to Flip';

  void flipCoin() {
    setState(() {
      coinSide = Random().nextInt(2);
      result = coinSide == 0 ? 'Heads' : 'Tails';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 198, 168),
      appBar: AppBar(
        title: const Text("Coin Flip"),
        backgroundColor: const Color.fromARGB(255, 47, 71, 155),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: Image.asset(
                  coinSide == 0
                      ? 'assets/images/bleu_head.jpg'
                      : 'assets/images/cat_back.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 100,
                      color: Colors.red,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: flipCoin,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 47, 71, 155),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Flip Coin"),
              ),
              const SizedBox(height: 20),
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
      ),
    );
  }
}
