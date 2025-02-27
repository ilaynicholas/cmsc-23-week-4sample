import 'package:flutter/material.dart';
import 'models/user_model.dart';

class FormSample extends StatefulWidget {
  const FormSample({super.key});

  @override
  State<FormSample> createState() => _FormSampleState();
}

class _FormSampleState extends State<FormSample> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  User? _userValues;
  bool? _isHappy = false;
  String? _selectedMood;

  final List<String> _dropdownOptions = [
    "saks lang",
    "di na natutuwa sa flutter",
    "antok na",
    "cmsc23 napakabasic",
    "gutom",
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // all onSaved properties will be triggered
      _formKey.currentState!.save();

      setState(() {
        _userValues = User(
          name: _nameController.text,
          email: _emailController.text,
          isHappy: _isHappy,
          mood: _selectedMood,
        );
      });

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              "Name: ${_userValues?.name}\nEmail: ${_userValues?.email}\nAre you happy?: ${_userValues?.isHappy}\nMood: ${_userValues?.mood}",
            ),
          );
        },
      );
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();

    setState(() {
      _nameController.clear();
      _emailController.clear();
      _isHappy = false;
      _selectedMood = null;
      _userValues = null;
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            "Name: ${_userValues?.name}\nEmail: ${_userValues?.email}\nAre you happy?: ${_userValues?.isHappy}\nMood: ${_userValues?.mood}",
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Divider(thickness: 3, color: Colors.grey),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter string",
                  labelText: "Name",
                ),
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }

                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter string",
                  labelText: "Email",
                ),
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                  ).hasMatch(value)) {
                    return "Enter a valid email address";
                  }

                  return null;
                },
              ),
            ),
            FormField(
              builder: (FormFieldState<bool> state) {
                return CheckboxListTile(
                  title: Text("Happy ka ba?"),
                  value: _isHappy,
                  onChanged: (bool? value) {
                    setState(() {
                      _isHappy = value ?? false;
                    });
                  },
                );
              },
              onSaved: ((bool? value) {
                print("Checkbox onSaved method triggered");
              }),
            ),
            DropdownButtonFormField<String>(
              hint: Text("Ano mood mo?"),
              value: _selectedMood,
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  _selectedMood = value;
                });
              },
              items:
                  _dropdownOptions.map((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onSaved: (newValue) {
                print("Dropdown onSaved method triggered");
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: _submitForm, child: Text('Submit')),
                  ElevatedButton(onPressed: _resetForm, child: Text('Reset')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
