import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firstaid/screens/situation_selection_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
        'Navigation from situation_selection_screen to first_aid_steps_screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: SituationSelectionScreen(),
      ));

      expect(find.text('Injuries'), findsOneWidget);
      await tester.tap(find.text('Injuries'));
      await tester.pumpAndSettle();

      expect(find.text('First Aid Steps'), findsOneWidget);
      expect(find.text('Step 1: Assess the situation'), findsOneWidget);
    });
  });
}
