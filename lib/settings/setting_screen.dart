import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morty_flutter/core/widgets/extensions/dialogs.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: SettingsList(
          sections: [
            SettingsSection(
              title: Text("common".tr()),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.language),
                  title: Text("language".tr()),
                  value: Text('English'),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {},
                  initialValue: true,
                  leading: const Icon(Icons.format_paint),
                  title: Text("theme".tr()),
                ),
              ],
            ),
            SettingsSection(
              title: Text("dev".tr()),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.developer_mode),
                  title: Text("clear_cache".tr()),
                ),
              ],
            ),
            SettingsSection(
              title: Text("account".tr()),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  onPressed: (context) {
                    context.showLogoutDialog();
                  },
                  leading: Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.onError,
                  ),
                  title: Text(
                    "logout".tr(),
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.onError),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
