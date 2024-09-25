import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firstaid/widgets/situation_card.dart';
import 'package:firstaid/models/situation.dart';
import 'package:firstaid/widgets/cpr_steps.dart';

void main() {
  testWidgets('golden test for situation_card', (WidgetTester tester) async {
    final situation = Situation(
      emoji: '🩹',
      text: 'Injuries',
      steps: ['Step 1: Do this', 'Step 2: Do that'],
    );

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: SituationCard(
          situation: situation,
          onTap: () {},
        ),
      ),
    ));

    await expectLater(
      find.byType(SituationCard),
      matchesGoldenFile('goldens/counter_widget_0.png'),
    );

    await tester.tap(find.byType(SituationCard));
    await tester.pumpAndSettle();

    await expectLater(find.byType(SituationCard),
        matchesGoldenFile('goldens/counter_widget_1.png'));
  });

  testWidgets('CPRStepWidget golden test', (WidgetTester tester) async {
    final widget = MaterialApp(
      home: Scaffold(
        body: CPRStepWidget(
          title: 'Step 1: Check breathing',
          text: 'Ensure the person is breathing before proceeding.',
          imagePath: 'assets/cpr_step_1.png',
        ),
      ),
    );

    await tester.pumpWidget(widget);

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(CPRStepWidget),
      matchesGoldenFile('goldens/cpr_step_widget.png'),
    );
  });
}
