import 'package:firstaid/models/situation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('create a situation object #1', () {
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
      ]
    );
  });

  test('create a situation object #2', () {
    final situation = Situation(
      emoji: '😵',
      text: 'Fainting',
      steps: [
        'Step 1: Lay the person down',
        'Step 2: Elevate their legs',
        'Step 3: Check for breathing',
      ],
    );
    expect(situation.emoji, '😵');
    expect(situation.text, 'Fainting');
    expect(situation.steps.length, 3);
    expect(situation.steps, [
        'Step 1: Lay the person down',
        'Step 2: Elevate their legs',
        'Step 3: Check for breathing',
      ]
    );
  });
}