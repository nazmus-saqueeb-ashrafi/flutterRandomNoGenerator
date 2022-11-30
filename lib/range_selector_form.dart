import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class FormWidget extends StatelessWidget {
  FormWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.minValueSetter,
    required this.maxValueSetter,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              textInput: "Enter Minimum",
              intValueSetter: minValueSetter,
            ),
            const SizedBox(
              height: 10,
            ),
            InputField(
              textInput: "Enter Maximum",
              intValueSetter: maxValueSetter,
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.textInput,
    required this.intValueSetter,
  }) : super(key: key);

  final String textInput;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: textInput,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      onSaved: (newValue) => intValueSetter(
        int.parse(newValue ?? ''),
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return "Must be a number";
        } else {
          return null;
        }
      },
    );
  }
}
