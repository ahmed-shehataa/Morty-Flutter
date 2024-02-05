import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morty_flutter/login/presentation/screen/login_screen.dart';
import 'package:morty_flutter/morty/presentation/screen/morty_screen.dart';

import 'core/localization/constants.dart';
import 'di/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // TODO why?
  await initGetIT();
  runApp(EasyLocalization(
      supportedLocales: supportedLocales,
      path: localizationPath, // <-- change the path of the translation files
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MortyScreen(),
    );
  }
}
