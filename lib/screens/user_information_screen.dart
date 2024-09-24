import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    await prefs.setString(
        'medicalConditions', _medicalConditionsController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.healthInfoSaved)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.myHealthInfo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _bloodTypeController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.bloodType,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _allergiesController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.allergies,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _medicalConditionsController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.medicalConditions,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _saveHealthInfo,
              child: Text(AppLocalizations.of(context)!.saveInfo),
            ),
          ],
        ),
      ),
    );
  }
}
