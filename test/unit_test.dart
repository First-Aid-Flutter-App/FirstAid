import 'package:firstaid/models/situation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firstaid/notifiers/first_aid_steps_notifier.dart';

void main() {
  test('create a situation object', () {
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
    expect(situation.emoji, '🩹');
    expect(situation.text, 'Injuries');
    expect(situation.steps.length, 4);
    expect(situation.steps, [
      'Step 1: Assess the situation',
      'Step 2: Stop the bleeding',
      'Step 3: Clean the wound',
      'Step 4: Bandage the wound',
    ]);
  });

  test('first_aid_steps_notifier toggles steps correctly', () {
    final notifier = FirstAidStepsNotifier('test', 3);

    expect(notifier.state, [false, false, false]);

    notifier.toggleStep('test', 1);
    expect(notifier.state, [false, true, false]);

    notifier.toggleStep('test', 1);
    expect(notifier.state, [false, false, false]);
  });
}
