import 'package:flutter/material.dart';
import 'button_sample.dart';
import 'checkbox_sample.dart';
import 'dropdown_sample.dart';
import 'form_sample.dart';
import 'input_field_sample.dart';
import 'multiple_checkbox_sample.dart';

class UserInteractivitySample extends StatefulWidget {
  const UserInteractivitySample({super.key});

  @override
  State<UserInteractivitySample> createState() => _UserInteractivitySampleState();
}

class _UserInteractivitySampleState extends State<UserInteractivitySample> {
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
          // InputFieldSample(),
          // CheckboxSample(),
          // MultipleCheckboxSample(),
          // DropdownSample(),
          // FormSample()
        ],
      ),
    );
  }
}
