import 'theme/app_theme_provider.dart';
import 'theme/shared_utility.dart';
import 'screens/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';


Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
 final sharedPreferences = await SharedPreferences.getInstance();
 runApp(ProviderScope(
 overrides: [
 // override the previous value with the new object
 sharedPreferencesProvider.overrideWithValue(sharedPreferences),
 ],
 child: MyApp(),
 ));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final _appThemeState = ref.watch(appThemeStateProvider);

    return MaterialApp(
      title: 'First Aid App',
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ref
        .read(appThemeProvider)
        .getAppThemedata(context, _appThemeState),
      home: MainScreen(),
    );
  }
}
