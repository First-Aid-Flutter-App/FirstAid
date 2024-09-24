import 'package:firstaid/widgets/cpr_steps.dart';
import 'package:firstaid/widgets/cpr_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CPRGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.cprGuide),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Step 1: Check breathing
          CPRStepWidget(
              title: AppLocalizations.of(context)!.cprStep1Title,
              text: AppLocalizations.of(context)!.cprStep1Text,
              imagePath: 'assets/cpr_step_1.png'),

          // Step 2: Chest compressions
          CPRStepWidget(
              title: AppLocalizations.of(context)!.cprStep2Title,
              text: AppLocalizations.of(context)!.cprStep2Text,
              imagePath: 'assets/cpr_step_2.png'),

          // Step 3: Rescue breaths
          CPRStepWidget(
              title: AppLocalizations.of(context)!.cprStep3Title,
              text: AppLocalizations.of(context)!.cprStep3Text,
              imagePath: 'assets/cpr_step_3.png'),

          // Step 4: Repeat
          CPRStepWidget(
              title: AppLocalizations.of(context)!.cprStep4Title,
              text: AppLocalizations.of(context)!.cprStep4Text,
              imagePath: null),

          // Timer Section
          CPRTimerWidget(),
        ]),
      ),
    );
  }
}
