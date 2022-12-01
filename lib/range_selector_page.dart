import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_pod_demo/randomizer_change_notifier.dart';
import 'package:river_pod_demo/randomizer_page.dart';
import 'package:river_pod_demo/range_selector_form.dart';

class RangeSelectorPage extends StatelessWidget {
  RangeSelectorPage({super.key, required this.title});

  final _formKey = GlobalKey<FormState>();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Number Generator"),
      ),
      body: FormWidget(
        formKey: _formKey,
        maxValueSetter: ((value) =>
            context.read<RandomizerChangeNotifier>().max = value),
        minValueSetter: ((value) =>
            context.read<RandomizerChangeNotifier>().max = value),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ask form to tells its inputs to validate
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState?.validate() == true) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            _formKey.currentState?.save();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text(
                      'Click generate button to generate a random number')),
            );

            // navigate to generator page
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RandomizerPage(),
              ),
            );
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
