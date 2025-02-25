import 'package:flutter/material.dart';

class DropdownSample extends StatefulWidget {
  const DropdownSample({super.key});

  @override
  State<DropdownSample> createState() => _DropdownSampleState();
}

class _DropdownSampleState extends State<DropdownSample> {
  static final List<String> _dropdownOptions = [
    "Choose one",
    "cmsc23 ez",
    "cmsc23 hard",
    "cmsc23 boring",
    "cmsc23 laughable",
    "cmsc23 pwede na",
  ];

  String? _dropdownValue = _dropdownOptions.first;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton<String>(
              value: _dropdownValue,
              onChanged: (String? value) {
                // called when the user selects an item
                setState(() {
                  _dropdownValue = value!;
                });
              },
              items:
                  _dropdownOptions.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem(
                        value: value, 
                        child: Text(value)
                      );
                    }
                  ).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("Dropdown value: $_dropdownValue"),
                  );
                },
              );
            },
            child: const Text('Show dropdown value'),
          ),
        ],
      ),
    );
  }
}
