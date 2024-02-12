import 'dart:ui';

import 'package:morty_flutter/core/theme/constants.dart';

abstract class SettingEvent {}

class LogoutEvent extends SettingEvent {}

class ChangeAppLocalEvent extends SettingEvent {
  final Locale appLocale;

  ChangeAppLocalEvent({required this.appLocale});
}

class ClearCacheEvent extends SettingEvent {}

class ChangeAppThemeEvent extends SettingEvent {
  final AppTheme appTheme;

  ChangeAppThemeEvent({required this.appTheme});
}
