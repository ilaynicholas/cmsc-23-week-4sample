import 'package:flutter/material.dart';

class InputFieldSample extends StatefulWidget {
  const InputFieldSample({super.key});

  @override
  State<InputFieldSample> createState() => _InputFieldSampleState();
}

class _InputFieldSampleState extends State<InputFieldSample> {
  String _searchTerm = "";

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // start listening to any changes in the controller
    _searchController.addListener(() {
      print("Latest value: ${_searchController.text}");
    });
  }

  @override
  void dispose() {
    // cleans the controller when the widget is removed from the widget tree
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter string",
                labelText: "Using onChanged",
              ),
              onChanged: (String value) {
                _searchTerm = value;
                print(_searchTerm);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter string",
                labelText: "Using Controller",
              ),
              controller: _searchController,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(
                      "onChanged: $_searchTerm \nController: ${_searchController.text}",
                    ),
                  );
                },
              );
            },
            child: Text("Show text"),
          ),
        ],
      ),
    );
  }
}
