import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'mocking_test.mocks.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([SharedPreferences])

void main() {
  final mockPrefs = MockSharedPreferences();

  group('SharedPreferences tests for user_information_screen logic', () {
    test('loads health info from SharedPreferences', () async {
      when(mockPrefs.getString('bloodType')).thenReturn('A+');
      when(mockPrefs.getString('allergies')).thenReturn('Peanuts');
      when(mockPrefs.getString('medicalConditions')).thenReturn('Asthma');

      final bloodType = mockPrefs.getString('bloodType');
      final allergies = mockPrefs.getString('allergies');
      final medicalConditions = mockPrefs.getString('medicalConditions');

      expect(bloodType, 'A+');
      expect(allergies, 'Peanuts');
      expect(medicalConditions, 'Asthma');
    });

    test('saves health info to SharedPreferences', () async {
      when(mockPrefs.setString('bloodType', 'B+')).thenAnswer((_) async => true);
      when(mockPrefs.setString('allergies', 'None')).thenAnswer((_) async => true);
      when(mockPrefs.setString('medicalConditions', 'Diabetes')).thenAnswer((_) async => true);

      mockPrefs.setString('bloodType', 'B+');
      mockPrefs.setString('allergies', 'None');
      mockPrefs.setString('medicalConditions', 'Diabetes');

      verify(mockPrefs.setString('bloodType', 'B+')).called(1);
      verify(mockPrefs.setString('allergies', 'None')).called(1);
      verify(mockPrefs.setString('medicalConditions', 'Diabetes')).called(1);
    });
  });
}
