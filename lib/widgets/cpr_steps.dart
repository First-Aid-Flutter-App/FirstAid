import 'package:flutter/material.dart';

class CPRStepWidget extends StatelessWidget {
  final String title;
  final String text;
  final String? imagePath;

  CPRStepWidget({required this.title, required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          text,
        ),
        
        if (imagePath != null)
          Container(
            constraints: const BoxConstraints(
              maxWidth: 700.0,
            ),
            child: Image.asset(
              imagePath!,
              width: MediaQuery.of(context).size.width * 0.7
            ),
          ),

        const SizedBox(height: 16),
      ],
    );
  }
}
