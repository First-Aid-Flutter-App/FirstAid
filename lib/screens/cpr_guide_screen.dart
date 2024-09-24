import 'package:firstaid/widgets/cpr_steps.dart';
import 'package:firstaid/widgets/cpr_timer.dart';
import 'package:flutter/material.dart';

class CPRGuideScreen extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CPR Guide'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step 1: Check breathing
            CPRStepWidget(
              title: 'Step 1: Check if the person is breathing.',
              text: 'Place your ear above the person\'s mouth, looking at the chest and search for signs of breathing.', 
              imagePath: 'assets/cpr_step_1.png'
            ),

            // Step 2: Chest compressions
            CPRStepWidget(
              title: 'Step 2: Begin chest compressions.',
              text: 'Place your hands in the center of the chest and push hard and fast at a rate of 100-120 compressions per minute.',
              imagePath: 'assets/cpr_step_2.png'
            ),

            // Step 3: Rescue breaths
            CPRStepWidget(
              title: 'Step 3: Give rescue breaths.',
              text: 'Tilt the person\'s head back, lift the chin, pinch the nose, and give 2 rescue breaths, each lasting about 1 second.',
              imagePath: 'assets/cpr_step_3.png'
            ),

            // Step 4: Repeat
            CPRStepWidget(
              title: 'Step 4: Repeat the cycle.',
              text: 'Continue giving 30 chest compressions followed by 2 rescue breaths until help arrives.',
              imagePath: null
            ),

            // Timer Section
            CPRTimerWidget(),
          ]
        ),
      ),
    );
  }
}
