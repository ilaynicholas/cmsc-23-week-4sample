import 'package:flutter/material.dart';
import 'button_sample.dart';
import 'checkbox_sample.dart';
import 'input_field_sample.dart';

class FormSample extends StatefulWidget {
  const FormSample({super.key});

  @override
  State<FormSample> createState() => _FormSampleState();
}

class _FormSampleState extends State<FormSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Sample"),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonSample(),
          InputFieldSample(),
          CheckboxSample()
        ],
      ),
    );
  }
}