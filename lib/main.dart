import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: const Center(child: Text('Dicee')),
            backgroundColor: Colors.red,
          ),
          body: const DicePage()),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDicNum = 1;
  int rightDicNum = 1;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    void rollingDice() {
      setState(() {
        leftDicNum = Random().nextInt(6) + 1;
        rightDicNum = Random().nextInt(6) + 1;
        total = leftDicNum + rightDicNum;
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$total',
          style: const TextStyle(
            fontSize: 54,
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  rollingDice();
                },
                child: Image.asset('images/dice$leftDicNum.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  rollingDice();
                },
                child: Image.asset('images/dice$rightDicNum.png'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        TextButton(
          onPressed: () {
            rollingDice();
          },
          child: Container(
            color: Colors.redAccent,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: const Text('Roll', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
