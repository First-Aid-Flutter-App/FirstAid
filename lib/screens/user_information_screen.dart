import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  _MyInfoScreenState createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();
  final TextEditingController _medicalConditionsController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadHealthInfo();
  }

  // Load saved data from SharedPreferences
  Future<void> _loadHealthInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _bloodTypeController.text = prefs.getString('bloodType') ?? '';
      _allergiesController.text = prefs.getString('allergies') ?? '';
      _medicalConditionsController.text =
          prefs.getString('medicalConditions') ?? '';
    });
  }

  // Save health info to SharedPreferences
  Future<void> _saveHealthInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('bloodType', _bloodTypeController.text);
    await prefs.setString('allergies', _allergiesController.text);
    await prefs.setString('medicalConditions', _medicalConditionsController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Health information saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Health Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _bloodTypeController,
              decoration: const InputDecoration(
                labelText: 'Blood Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _allergiesController,
              decoration: const InputDecoration(
                labelText: 'Allergies',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _medicalConditionsController,
              decoration: const InputDecoration(
                labelText: 'Medical Conditions',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _saveHealthInfo,
              child: const Text('Save Info'),
            ),
          ],
        ),
      ),
    );
  }
}
