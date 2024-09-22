import 'package:flutter/material.dart';
import 'screens/situation_selection_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Aid Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SituationSelectionScreen(),
    );
  }
}
