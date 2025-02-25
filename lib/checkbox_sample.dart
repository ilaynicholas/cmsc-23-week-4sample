import 'package:flutter/material.dart';

class CheckboxSample extends StatefulWidget {
  const CheckboxSample({super.key});

  @override
  State<CheckboxSample> createState() => _CheckboxSampleState();
}

class _CheckboxSampleState extends State<CheckboxSample> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value!;
              });
            },
          ),
          // CheckboxListTile(
          //   title: Text("Pagod ka na ba?"),
          //   value: _isChecked,
          //   onChanged: (bool? value) {
          //     setState(() {
          //       _isChecked = value!;
          //     });
          //   },
          // ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("Checkbox value: $_isChecked"),
                  );
                },
              );
            },
            child: const Text('Show checkbox value'),
          ),
        ],
      ),
    );
  }
}
