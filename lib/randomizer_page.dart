import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerPage extends StatefulWidget {
  final int minimum;
  final int maximum;

  const RandomizerPage({
    super.key,
    required this.minimum,
    required this.maximum,
  });

  @override
  State<RandomizerPage> createState() => _RandomizerPageState();
}

class _RandomizerPageState extends State<RandomizerPage> {
  final rng = Random();
  int? randomNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Randomizer page"),
      ),
      body: Center(
        child: Text(
          randomNumber?.toString() ?? "Generation awaiting",
          style: const TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Generate"),
        onPressed: () {
          setState(
            () {
              randomNumber = widget.minimum +
                  rng.nextInt(widget.maximum + 1 - widget.minimum);
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
