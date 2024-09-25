import 'package:firstaid/screens/user_information_screen.dart';
import 'package:flutter/material.dart';
import '../models/situation.dart';
import 'first_aid_steps_screen.dart';
import '../widgets/situation_card.dart';
import 'package:firstaid/providers/situation_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SituationSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.situations)
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
                      FirstAidStepsScreen(id: situations[index].text),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
