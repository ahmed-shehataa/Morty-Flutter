import 'dart:ui';

import 'package:morty_flutter/core/theme/constants.dart';

class SettingState {
  final AppTheme appTheme;
  final Locale appLocal;
  final bool isLoggedOut;
  final bool isLoading;

  const SettingState({
    required this.appLocal,
    required this.appTheme,
    this.isLoggedOut = false,
    this.isLoading = false,
  });

  SettingState copy({
    AppTheme? appTheme,
    Locale? appLocal,
    bool? isLoggedOut,
    bool? isLoading,
  }) {
    return SettingState(
      appLocal: appLocal ?? this.appLocal,
      appTheme: appTheme ?? this.appTheme,
      isLoggedOut: isLoggedOut ?? this.isLoggedOut,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
