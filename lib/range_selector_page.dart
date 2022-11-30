import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:river_pod_demo/randomizer_page.dart';
import 'package:river_pod_demo/range_selector_form.dart';

class RangeSelectorPage extends HookWidget {
  RangeSelectorPage({super.key, required this.title});

  final _formKey = GlobalKey<FormState>();
  final String title;

  @override
  Widget build(BuildContext context) {
    final minimum = useState<int>(0);
    final maximum = useState<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Number Generator"),
      ),
      body: FormWidget(
        formKey: _formKey,
        maxValueSetter: ((value) => maximum.value = value),
        minValueSetter: ((value) => minimum.value = value),
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
                  minimum: minimum.value,
                  maximum: maximum.value,
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
