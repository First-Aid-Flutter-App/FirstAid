import 'package:flutter/material.dart';

class FirstAidStepsScreen extends StatefulWidget {
  final List<String> steps;

  FirstAidStepsScreen({required this.steps});

  @override
  _FirstAidStepsScreenState createState() => _FirstAidStepsScreenState();
}

class _FirstAidStepsScreenState extends State<FirstAidStepsScreen> {
  late List<bool> _checked;

  @override
  void initState() {
    super.initState();
    _checked = List<bool>.filled(widget.steps.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid Steps'),
      ),
      body: ListView.builder(
        itemCount: widget.steps.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Checkbox(
                value: _checked[index],
                onChanged: (bool? value) {
                  setState(() {
                    _checked[index] = value ?? false;
                  });
                },
              ),
              title: Text(widget.steps[index]),
            ),
          );
        },
      ),
    );
  }
}
