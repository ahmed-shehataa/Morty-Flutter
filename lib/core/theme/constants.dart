import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

const defaultTheme = AppTheme.system;

enum AppTheme {
  system,
  light,
  dark;

  String getName() {
    return name.tr();
  }

  static AppTheme getType(String name) {
    switch (name) {
      case 'system':
        return AppTheme.system;
      case 'light':
        return AppTheme.light;
      case 'dark':
        return AppTheme.dark;
      default:
        throw ArgumentError('Invalid name: $name');
    }
  }
}

extension AppThemeMapper on AppTheme {

  ThemeMode toThemeMode() {
    switch(this) {
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.dark:
        return ThemeMode.dark;
      case AppTheme.system:
        return ThemeMode.system;
    }
  }
}
