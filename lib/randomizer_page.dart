import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  final int minimum;
  final int maximum;
  final rng = Random();

  RandomizerPage({
    super.key,
    required this.minimum,
    required this.maximum,
  });

  @override
  Widget build(BuildContext context) {
    final randomNumber = useState<int?>(null);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Randomizer page"),
      ),
      body: Center(
        child: Text(
          randomNumber.value?.toString() ?? "Generation awaiting",
          style: const TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Generate"),
        onPressed: () {
          randomNumber.value = minimum + rng.nextInt(maximum + 1 - minimum);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
