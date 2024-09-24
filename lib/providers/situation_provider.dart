import '../models/situation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<Situation> situations = [
  Situation(
    emoji: '🩹',
    text: 'Injuries',
    steps: [
      'Step 1: Assess the situation',
      'Step 2: Stop the bleeding',
      'Step 3: Clean the wound',
      'Step 4: Bandage the wound',
    ],
  ),
  Situation(
    emoji: '😵',
    text: 'Fainting',
    steps: [
      'Step 1: Lay the person down',
      'Step 2: Elevate their legs',
      'Step 3: Check for breathing',
    ],
  ),
  Situation(
    emoji: '💔',
    text: 'Heart Attack',
    steps: [
      'Step 1: Call emergency services',
      'Step 2: Keep the person calm',
      'Step 3: Administer CPR if needed',
    ],
  ),
  Situation(
    emoji: '😤',
    text: 'Asphyxia',
    steps: [
      'Step 1: Check for obstruction',
      'Step 2: Encourage coughing',
      'Step 3: Administer back blows if necessary',
    ],
  ),
  Situation(
    emoji: '🩸',
    text: 'Bleeding',
    steps: [
      'Step 1: Apply direct pressure',
      'Step 2: Elevate the wound',
      'Step 3: Seek medical help if needed',
    ],
  ),
  Situation(
    emoji: '☀️',
    text: 'Sunstroke',
    steps: [
      'Step 1: Move to a cool place',
      'Step 2: Apply cool cloths',
      'Step 3: Seek medical assistance if symptoms persist',
    ],
  ),
  Situation(
    emoji: '🔥',
    text: 'Burn',
    steps: [
      'Step 1: Cool the burn under running water',
      'Step 2: Cover with a clean cloth',
      'Step 3: Do not apply ice directly',
    ],
  ),
  Situation(
    emoji: '⚡',
    text: 'Electric Shock',
    steps: [
      'Step 1: Call emergency services',
      'Step 2: Do not touch the person if they are still in contact with the source',
      'Step 3: Perform CPR if necessary and trained',
    ],
  ),
];

final situationProvider = Provider.family<Situation, String>((ref, id) {
  return situations.firstWhere((situation) => situation.text == id);
});
