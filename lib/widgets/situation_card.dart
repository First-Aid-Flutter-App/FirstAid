import 'package:flutter/material.dart';
import '../models/situation.dart';

class SituationCard extends StatelessWidget {
  final Situation situation;
  final VoidCallback onTap;

  SituationCard({required this.situation, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              situation.emoji,
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 10),
            Text(
              situation.text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
