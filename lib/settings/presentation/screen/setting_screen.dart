import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morty_flutter/core/localization/language_local.dart';
import 'package:morty_flutter/core/widgets/extensions/dialogs.dart';
import 'package:morty_flutter/di/app_module.dart';
import 'package:morty_flutter/login/presentation/screen/login_screen.dart';
import 'package:morty_flutter/settings/presentation/bloc/setting_bloc.dart';
import 'package:morty_flutter/settings/presentation/contract/setting_event.dart';
import 'package:settings_ui/settings_ui.dart';

import '../contract/setting_state.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingBloc settingBloc = getIt.get();
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.white),
          elevation: 2,
          title: Text(
            "setting".tr(),
            style: Theme.of(context).textTheme.displayMedium,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: BlocConsumer<SettingBloc, SettingState>(
          bloc: settingBloc,
          listener: (context, state) {
            if (state.isLoggedOut) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            }
          },
          builder: (BuildContext context, SettingState state) {
            return SettingsList(
              sections: [
                SettingsSection(
                  title: Text("common".tr()),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      leading: const Icon(Icons.language),
                      title: Text("language".tr()),
                      value: Text(state.appLocal.getDisplayLanguage()),
                      onPressed: (context) {
                        context.showLocalDialog(
                          state.appLocal,
                          (selectedLocale) {
                            settingBloc.add(ChangeAppLocalEvent(appLocale: selectedLocale));
                            context.setLocale(selectedLocale);
                          },
                        );
                      },
                    ),
                    SettingsTile.navigation(
                      onPressed: (context) {
                        //settingBloc.add(ChangeThemeEvent(isDark: value));
                      },
                      leading: const Icon(Icons.format_paint),
                      title: Text("theme".tr()),
                      value: Text(state.appTheme.name),
                    ),
                  ],
                ),
                SettingsSection(
                  title: Text("dev".tr()),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      leading: const Icon(Icons.developer_mode),
                      title: Text("clear_cache".tr()),
                      onPressed: (context) {},
                    ),
                  ],
                ),
                SettingsSection(
                  title: Text("account".tr()),
                  tiles: <SettingsTile>[
                    SettingsTile.navigation(
                      onPressed: (_context) {
                        context.showLogoutDialog(
                          () {
                            settingBloc.add(LogoutEvent());
                          },
                        );
                      },
                      leading: Icon(
                        Icons.logout,
                        color: Theme.of(context).colorScheme.onError,
                      ),
                      title: Text(
                        "logout".tr(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onError),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ));
  }
}
