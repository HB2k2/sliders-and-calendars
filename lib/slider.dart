// slider and text field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MySliderPage extends StatefulWidget {
  const MySliderPage({super.key});

 

  @override
  _MySliderPageState createState() => _MySliderPageState();
}

class _MySliderPageState extends State<MySliderPage> {
  double frequencyValue = 1;
  final TextEditingController _textController =
      TextEditingController(text: '1'); // Fixed initialization

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Slider')),
      body: Column(
        children: [
          SliderTheme(
            data: const SliderThemeData(
              trackHeight: 8,
              activeTrackColor: Colors.green,
            ),
            child: Slider(
              value: frequencyValue,
              min: 0.3,
              max: 2,
              label: frequencyValue.toStringAsFixed(1), // Fixed label format
              thumbColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  frequencyValue = value;
                  _textController.text = value.toStringAsFixed(1); // Update text field
                });
                HapticFeedback.lightImpact();
              },
              onChangeEnd: (value) {
                setState(() {
                  frequencyValue = value;
                });
              },
            ),
          ),
          //
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'FREQUENCY',
              ),
              onChanged: (value) {
                setState(() {
                  frequencyValue = double.parse(value);
                });
              },
              keyboardType: const TextInputType.numberWithOptions(decimal: true), // Allow decimal input
            ),
          )
        ],
      ),
    );
  }
}
