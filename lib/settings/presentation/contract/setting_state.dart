import 'package:morty_flutter/core/theme/constants.dart';

class SettingState {
  final AppTheme appTheme;
  final String local;
  final bool isLoggedOut;
  final bool isLoading;

  const SettingState({
    required this.local,
    required this.appTheme,
    this.isLoggedOut = false,
    this.isLoading = false,
  });

  SettingState copy({
    AppTheme? appTheme,
    String? local,
    bool? isLoggedOut,
    bool? isLoading,
  }) {
    return SettingState(
      local: local ?? this.local,
      appTheme: appTheme ?? this.appTheme,
      isLoggedOut: isLoggedOut ?? this.isLoggedOut,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
