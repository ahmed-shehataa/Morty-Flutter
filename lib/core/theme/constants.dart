import 'package:easy_localization/easy_localization.dart';

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

const defaultTheme = AppTheme.system;
