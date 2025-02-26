import 'package:flutter/material.dart';

class MultipleCheckboxSample extends StatefulWidget {
  const MultipleCheckboxSample({super.key});

  @override
  State<MultipleCheckboxSample> createState() => _MultipleCheckboxSampleState();
}

class _MultipleCheckboxSampleState extends State<MultipleCheckboxSample> {
  final Map<String, bool> _items = {
    "pagod?": false,
    "gutom?": false,
    "lumbay?": false,
    "lungkot?": false,
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:
            _items.keys.map((key) {
              return CheckboxListTile(
                title: Text(key),
                value: _items[key],
                onChanged: (bool? value) {
                  setState(() {
                    _items[key] = value!;
                  });
                },
              );
            }).toList(),
      ),
    );
  }
}
