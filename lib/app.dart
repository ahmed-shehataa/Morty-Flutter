import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morty_flutter/core/theme/constants.dart';
import 'package:morty_flutter/login/presentation/screen/login_screen.dart';
import 'package:morty_flutter/morty/presentation/screen/morty_screen.dart';
import 'package:morty_flutter/splash/presentation/screen/splash_screen.dart';
import 'package:morty_flutter/theme/app_theme.dart';
import 'package:morty_flutter/user/domain/use_case/get_theme_use_case.dart';

import 'core/localization/constants.dart';
import 'di/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // TODO why?
  await initGetIT();
  runApp(EasyLocalization(
      startLocale: defaultLocal,
      supportedLocales: supportedAppLocales,
      useOnlyLangCode: true,
      saveLocale: true,
      path: localizationPath,
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GetThemeUseCase getThemeUseCase = getIt.get();
  late AppTheme _appTheme;

  @override
  void initState() {
    super.initState();
    _appTheme = getThemeUseCase.execute();
  }

  void changeTheme(AppTheme appTheme) {
    setState(() {
      _appTheme = appTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: getThemeData(context: context),
      darkTheme: getThemeData(context: context, isDark: true),
      themeMode: _appTheme.toThemeMode(),
      home: const SplashScreen(),
    );
  }
}
