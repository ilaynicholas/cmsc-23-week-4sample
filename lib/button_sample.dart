import 'package:flutter/material.dart';

class ButtonSample extends StatefulWidget {
  const ButtonSample({super.key});

  @override
  State<ButtonSample> createState() => _ButtonSampleState();
}

class _ButtonSampleState extends State<ButtonSample> {
  List<String> hobbies = ["eating", "sleeping", "running", "drawing", "yoga"];
  int _currentIndex = 0;
  List<Row> hobbiesList = [];

  _addToList() {
    if (_currentIndex < hobbies.length) {
      setState(() {
        hobbiesList.add(_buildHobbies(hobbies[_currentIndex]));
      });

      _currentIndex++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(onPressed: _addToList, child: Icon(Icons.add)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: hobbiesList,
          ),
        ],
      ),
    );
  }

  Row _buildHobbies(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.favorite_border),
        Container(
          margin: EdgeInsets.all(8),
          child: Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
