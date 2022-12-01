import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerChangeNotifier extends ChangeNotifier {
  final _randomGenerator = Random();

  int? _randomNumber;
  int? get generatedNumber => _randomNumber;

  int min = 0, max = 0;

  void generateRandomNumber() {
    _randomNumber = min + _randomGenerator.nextInt(max + 1 - min);
    notifyListeners();
  }
}

/* 

PROVIDER MECHANISM

- Create a RandomizerChangeNotifier to contain all the variables annd methods needed for this feature

- Wrap main MaterialApp with ChangeNotifierProvider and pass in create: ((context) => RandomizerChangeNotifier()),

- In nessasary files get:
 - variables like : context.read<RandomizerChangeNotifier>().max
 - methods like : context.read<RandomizerChangeNotifier>().generateRandomNumber()

- Get live updates on a variable using a Consumer :
  Consumer<RandomizerChangeNotifier>(
    builder: (context, notifier, child) {
      return Text(
        notifier.generatedNumber
      );
    },
  ),

*/
