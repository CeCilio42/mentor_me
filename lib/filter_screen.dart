import 'package:flutter/material.dart';
import 'result_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _distanceValue = 50.0;
  final TextEditingController _nameController = TextEditingController();
  String? _selectedSubject;

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
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(),
              ),
              value: _selectedSubject,
              items: <String>['Math', 'Science', 'History', 'English', 'Soccer']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSubject = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResultsScreen(),
                      ),
                    );
                  },
                  child: const Text('Apply'),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _nameController.clear();
                      _selectedSubject = null;
                      _distanceValue = 50.0;
                    });
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

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}