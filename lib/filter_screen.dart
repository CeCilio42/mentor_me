import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _distanceValue = 50.0; // Initial distance value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Name Field
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Subject Field (Dropdown)
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(),
              ),
              items: <String>['Math', 'Science', 'History', 'English']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle dropdown change here
              },
            ),

            const SizedBox(height: 20),

            // Distance Slider
            Row(
              children: <Widget>[
                const Text('Distance:'),
                Expanded(
                  child: Slider(
                    value: _distanceValue,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: '${_distanceValue.round()} km',
                    onChanged: (double newValue) {
                      setState(() {
                        _distanceValue = newValue;
                      });
                    },
                  ),
                ),
                Text('${_distanceValue.round()} km'),
              ],
            ),

            const Spacer(),

            // Apply and Reset Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Handle apply action
                  },
                  child: const Text('Apply'),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Handle reset action
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}