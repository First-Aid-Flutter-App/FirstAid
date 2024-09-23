import 'package:flutter/material.dart';

class CPRGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CPR Guide'),
      ),
      body: Center(
        child: Text(
          'Here are the CPR steps...',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
