import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_pod_demo/randomizer_change_notifier.dart';

class RandomizerPage extends StatelessWidget {
  const RandomizerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final randomNumber = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Randomizer page"),
      ),
      body: Center(
        child: Consumer<RandomizerChangeNotifier>(
          builder: (context, notifier, child) {
            return Text(
              notifier.generatedNumber?.toString() ?? "Generation awaiting",
              style: const TextStyle(fontSize: 40),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text("Generate"),
          onPressed: () {
            context.read<RandomizerChangeNotifier>().generateRandomNumber();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
