import 'package:flutter/material.dart';
import 'dart:async';

class CPRTimerWidget extends StatefulWidget {
  @override
  _CPRTimerWidgetState createState() => _CPRTimerWidgetState();
}

class _CPRTimerWidgetState extends State<CPRTimerWidget> {
  Timer? _timer;
  int _compressionCount = 0;
  bool isRunning = false;
  double bpm = 110;

  void startTimer() {
    setState(() {
      isRunning = true;
      _compressionCount = 0;
    });

    _timer = Timer.periodic(Duration(milliseconds: (60000 / bpm).round()),
        (Timer timer) {
      setState(() {
        _compressionCount++;
      });

      if (_compressionCount == 30) {
        _timer!.cancel();
        promptRescueBreaths();
      }
    });
  }

  void stopTimer() {
    setState(() {
      _compressionCount = 0;
      isRunning = false;
    });
    _timer?.cancel();
  }

  void promptRescueBreaths() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Give 2 Rescue Breaths"),
          content:
              Text("Press 'Continue' after performing the rescue breaths."),
          actions: [
            TextButton(
              child: Text("Continue"),
              onPressed: () {
                Navigator.of(context).pop();
                startTimer(); // Restart the metronome after the rescue breaths
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),

        // Compressions Counter
        Center(
          child: Text(
            'Compressions: $_compressionCount',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 16),

        // Pulsating Heart Icon
        Center(
          child: Icon(
            Icons.favorite,
            size: 100,
            color: _compressionCount % 2 == 0
                ? Colors.red
                : Colors.grey, // Alternate colors to simulate a beat
          ),
        ),

        const SizedBox(height: 32),

        // Start/Stop Timer Button
        Center(
          child: isRunning
              ? ElevatedButton(
                  onPressed: stopTimer,
                  child: const Text('Stop'),
                )
              : ElevatedButton(
                  onPressed: startTimer,
                  child: const Text('Start CPR Timer'),
                ),
        ),
      ],
    );
  }
}
