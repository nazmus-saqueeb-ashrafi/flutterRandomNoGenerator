import 'package:flutter/material.dart';
import 'package:river_pod_demo/randomizer_page.dart';
import 'package:river_pod_demo/range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({super.key, required this.title});

  final String title;

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  @override
  Widget build(BuildContext context) {
    int _minimum = 0;
    int _maximum = 0;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Number Generator"),
      ),
      body: FormWidget(
        formKey: _formKey,
        maxValueSetter: ((value) => _maximum = value),
        minValueSetter: ((value) => _minimum = value),
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
                builder: (context) => RandomizerPage(
                  minimum: _minimum,
                  maximum: _maximum,
                ),
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
