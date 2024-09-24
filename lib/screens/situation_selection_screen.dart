import 'package:firstaid/screens/user_information_screen.dart';
import 'package:flutter/material.dart';
import '../models/situation.dart';
import 'first_aid_steps_screen.dart';
import '../widgets/situation_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SituationSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define the situations list within the build method to access context
    final List<Situation> situations = [
      Situation(
        emoji: '🩹',
        text: AppLocalizations.of(context)!.injuries,
        steps: [
          AppLocalizations.of(context)!.injuriesStep1,
          AppLocalizations.of(context)!.injuriesStep2,
          AppLocalizations.of(context)!.injuriesStep3,
          AppLocalizations.of(context)!.injuriesStep4,
        ],
      ),
      Situation(
        emoji: '😵',
        text: AppLocalizations.of(context)!.fainting,
        steps: [
          AppLocalizations.of(context)!.faintingStep1,
          AppLocalizations.of(context)!.faintingStep2,
          AppLocalizations.of(context)!.faintingStep3,
        ],
      ),
      Situation(
        emoji: '💔',
        text: AppLocalizations.of(context)!.heart_attack,
        steps: [
          AppLocalizations.of(context)!.heartAttackStep1,
          AppLocalizations.of(context)!.heartAttackStep2,
          AppLocalizations.of(context)!.heartAttackStep3,
        ],
      ),
      Situation(
        emoji: '😤',
        text: AppLocalizations.of(context)!.asphyxia,
        steps: [
          AppLocalizations.of(context)!.asphyxiaStep1,
          AppLocalizations.of(context)!.asphyxiaStep2,
          AppLocalizations.of(context)!.asphyxiaStep3,
        ],
      ),
      Situation(
        emoji: '🩸',
        text: AppLocalizations.of(context)!.bleeding,
        steps: [
          AppLocalizations.of(context)!.bleedingStep1,
          AppLocalizations.of(context)!.bleedingStep2,
          AppLocalizations.of(context)!.bleedingStep3,
        ],
      ),
      Situation(
        emoji: '☀️',
        text: AppLocalizations.of(context)!.heat_strokes,
        steps: [
          AppLocalizations.of(context)!.heatStrokesStep1,
          AppLocalizations.of(context)!.heatStrokesStep2,
          AppLocalizations.of(context)!.heatStrokesStep3,
        ],
      ),
      Situation(
        emoji: '🔥',
        text: AppLocalizations.of(context)!.burn,
        steps: [
          AppLocalizations.of(context)!.burnStep1,
          AppLocalizations.of(context)!.burnStep2,
          AppLocalizations.of(context)!.burnStep3,
        ],
      ),
      Situation(
        emoji: '⚡',
        text: AppLocalizations.of(context)!.electric_injuries,
        steps: [
          AppLocalizations.of(context)!.electricInjuriesStep1,
          AppLocalizations.of(context)!.electricInjuriesStep2,
          AppLocalizations.of(context)!.electricInjuriesStep3,
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.situations),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyInfoScreen(),
                  ));
            },
            icon: const Icon(Icons.info_outline),
            iconSize: 35,
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: situations.length,
        itemBuilder: (context, index) {
          return SituationCard(
            situation: situations[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FirstAidStepsScreen(steps: situations[index].steps),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
