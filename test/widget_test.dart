import 'package:firstaid/models/situation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firstaid/screens/first_aid_steps_screen.dart';
import 'package:firstaid/screens/situation_selection_screen.dart';
import 'package:firstaid/widgets/situation_card.dart';

void main() {
  testWidgets('first_aid_steps_screen displays all steps and handles checkboxes correctly', (WidgetTester tester) async {
    final steps = ['Step 1: Do this', 'Step 2: Do that'];

    await tester.pumpWidget(MaterialApp(
      home: FirstAidStepsScreen(steps: steps),
    ));

    expect(find.text('First Aid Steps'), findsOneWidget);
    expect(find.text('Step 1: Do this'), findsOneWidget);
    expect(find.text('Step 2: Do that'), findsOneWidget);

    var checkboxes = tester.widgetList<Checkbox>(find.byType(Checkbox));
    for (var checkbox in checkboxes) {
      expect(checkbox.value, isFalse);
    }

    await tester.tap(find.byType(Checkbox).first);
    await tester.pumpAndSettle();

    expect(tester.widget<Checkbox>(find.byType(Checkbox).first).value, isTrue);
  });

  testWidgets('situation_selection_screen displays situations and navigates to first_aid_steps_screen correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SituationSelectionScreen(),
    ));

    expect(find.text('Injuries'), findsOneWidget);
    expect(find.text('Fainting'), findsOneWidget);

    await tester.tap(find.text('Injuries'));
    await tester.pumpAndSettle();

    expect(find.text('First Aid Steps'), findsOneWidget);
    expect(find.text('Step 1: Assess the situation'), findsOneWidget);
    expect(find.text('Step 2: Stop the bleeding'), findsOneWidget);
    expect(find.text('Step 3: Clean the wound'), findsOneWidget);
    expect(find.text('Step 4: Bandage the wound'), findsOneWidget);
  });

  testWidgets('situation_card displays correct text and emoji', (WidgetTester tester) async {
    final situation = Situation(
      emoji: '🩹',
      text: 'Injuries',
      steps: [
        'Step 1: Assess the situation',
        'Step 2: Stop the bleeding',
        'Step 3: Clean the wound',
        'Step 4: Bandage the wound',
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: SituationCard(
          situation: situation,
          onTap: () {},
        ),
      ),
    ));

    expect(find.text('🩹'), findsOneWidget);
    expect(find.text('Injuries'), findsOneWidget);
  });

  testWidgets('situation_card calls onTap when tapped', (WidgetTester tester) async {
    bool wasTapped = false;

    final situation = Situation(
      emoji: '🩹',
      text: 'Injuries',
      steps: [
        'Step 1: Assess the situation',
        'Step 2: Stop the bleeding',
        'Step 3: Clean the wound',
        'Step 4: Bandage the wound',
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: SituationCard(
          situation: situation,
          onTap: () {
            wasTapped = true;
          },
        ),
      ),
    ));

    await tester.tap(find.byType(SituationCard));
    await tester.pumpAndSettle();

    expect(wasTapped, isTrue);
  });
}