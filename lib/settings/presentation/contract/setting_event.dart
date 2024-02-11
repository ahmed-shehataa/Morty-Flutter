abstract class SettingEvent {}

class LogoutEvent extends SettingEvent {}

class ChangeThemeEvent extends SettingEvent {
  final bool isDark;

  ChangeThemeEvent({required this.isDark});

}
