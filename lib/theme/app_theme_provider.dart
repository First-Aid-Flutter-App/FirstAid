import 'package:firstaid/theme/shared_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/* AppTheme */
final appThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme();
});

class AppTheme {
  //Modify to add more colors here
  final ThemeData _lightThemeData = ThemeData(
    primaryColor: Colors.blueGrey[600],
    accentColor: Colors.blueGrey[100],
    scaffoldBackgroundColor: Colors.blueGrey[100],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          color: Colors.white,
        ),
        primary: Colors.red,
      ),
    ),
  );
  final ThemeData _darkThemeData = ThemeData(
    primaryColor: Colors.blue,
    accentColor: Colors.black12,
    scaffoldBackgroundColor: Colors.black12,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          color: Colors.white,
        ),
        primary: Colors.blue,
      ),
    ),
  );
  ThemeData getAppThemedata(BuildContext context, bool isDarkModeEnabled) {
  return isDarkModeEnabled ? _darkThemeData : _lightThemeData;
  }
}

/* AppTheme Notifier */
final appThemeStateProvider = StateNotifierProvider<AppThemeNotifier, bool>((ref) {
  final _isDarkModeEnabled = ref.read(_isDarkModeEnabledProvider.notifier).state;
  return AppThemeNotifier(_isDarkModeEnabled);
});

final _isDarkModeEnabledProvider = StateProvider<bool>((ref) => false);

class AppThemeNotifier extends StateNotifier<bool> {
  AppThemeNotifier(this.darkModeValue) : super(darkModeValue);
  final bool darkModeValue;

// Change the theme based on context
  toggleAppTheme(BuildContext context) {
    
    final _isDarkModeEnabled =
      ref.read(sharedUtilityProvider).isDarkModeEnabled();
    final _toggleValue = !_isDarkModeEnabled;
    context
    .read(
      sharedUtilityProvider,
    )
    .setDarkModeEnabled(_toggleValue)
    .whenComplete(
      () => {
        state = _toggleValue,
      },
    );
  }
}