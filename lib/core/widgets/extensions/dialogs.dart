import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morty_flutter/core/localization/language_local.dart';
import 'package:morty_flutter/core/theme/constants.dart';

import '../../common/constants/gif.dart';
import '../../localization/constants.dart';
import '../widgets/base_button.dart';

extension LoadingDialog on BuildContext {
  showLoadingDialog() {
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            GifRes.loading,
            height: 60,
            width: 60,
          ),
          Container(
              margin: const EdgeInsets.only(top: 12),
              child: Text("loading".tr())),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: this,
      builder: (BuildContext context) {
        return PopScope(canPop: false, child: alert);
      },
    );
  }

  hideLoadingDialog() {
    Navigator.pop(this);
  }
}

extension LogoutDialog on BuildContext {
  showLogoutDialog(VoidCallback onLogout) {
    AlertDialog alert = AlertDialog(
      alignment: Alignment.center,
      title: Text(
        "logout".tr(),
        style: Theme.of(this)
            .textTheme
            .labelLarge
            ?.copyWith(color: Theme.of(this).colorScheme.onError),
      ),
      content: Text(
        "are_you_sure_logout".tr(),
        style: Theme.of(this)
            .textTheme
            .labelMedium
            ?.copyWith(color: Theme.of(this).colorScheme.onPrimary),
      ),
      actions: [
        BaseButton(
          title: "cancel".tr(),
          onClicked: hideLogoutDialog,
          titleColor: Theme.of(this).colorScheme.onError,
          backgroundColor: Theme.of(this).colorScheme.onSecondary,
        ),
        BaseButton(
          title: "logout".tr(),
          onClicked: () {
            hideLogoutDialog();
            onLogout();
          },
        ),
      ],
    );
    showDialog(
      barrierDismissible: true,
      context: this,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  hideLogoutDialog() {
    Navigator.pop(this);
  }
}

extension LocalDialog on BuildContext {
  showLocalDialog(Locale selectedLocale, Function(Locale) onConfirm) {
    Locale? selectedLocaleRadio = selectedLocale;

    final alert = StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        alignment: Alignment.center,
        title: Text(
          "select_language".tr(),
          style: Theme.of(this)
              .textTheme
              .labelLarge
              ?.copyWith(color: Theme.of(this).colorScheme.primary),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: supportedAppLocales.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedLocaleRadio = supportedAppLocales[index];
                  });
                },
                child: ListTile(
                  title: Text(
                    supportedAppLocales[index].getDisplayLanguage(),
                    style: Theme.of(this)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Theme.of(this).colorScheme.onPrimary),
                  ),
                  leading: Radio(
                    activeColor: Theme.of(this).colorScheme.primary,
                    value: supportedAppLocales[index],
                    groupValue: selectedLocaleRadio,
                    onChanged: (value) {

                    },
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          BaseButton(
            title: "cancel".tr(),
            onClicked: () => Navigator.pop(this),
            titleColor: Theme.of(this).colorScheme.onError,
            backgroundColor: Theme.of(this).colorScheme.onSecondary,
          ),
          BaseButton(
            title: "confirm".tr(),
            onClicked: () {
              Navigator.pop(this);
              onConfirm(selectedLocaleRadio ?? selectedLocale);
            },
          ),
        ],
      );
    });
    showDialog(
      barrierDismissible: true,
      context: this,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}


extension ThemeDialog on BuildContext {
  showThemeDialog(AppTheme selectedTheme, Function(AppTheme) onConfirm) {
    AppTheme? selectedThemeRadio = selectedTheme;

    final alert = StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        alignment: Alignment.center,
        title: Text(
          "select_language".tr(),
          style: Theme.of(this)
              .textTheme
              .labelLarge
              ?.copyWith(color: Theme.of(this).colorScheme.primary),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: AppTheme.values.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedThemeRadio = AppTheme.values.elementAt(index);
                  });
                },
                child: ListTile(
                  title: Text(
                    AppTheme.values.elementAt(index).getName(),
                    style: Theme.of(this)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Theme.of(this).colorScheme.onPrimary),
                  ),
                  leading: Radio(
                    activeColor: Theme.of(this).colorScheme.primary,
                    value: AppTheme.values.elementAt(index),
                    groupValue: selectedThemeRadio,
                    onChanged: (value) {

                    },
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          BaseButton(
            title: "cancel".tr(),
            onClicked: () => Navigator.pop(this),
            titleColor: Theme.of(this).colorScheme.onError,
            backgroundColor: Theme.of(this).colorScheme.onSecondary,
          ),
          BaseButton(
            title: "confirm".tr(),
            onClicked: () {
              Navigator.pop(this);
              onConfirm(selectedThemeRadio ?? selectedTheme);
            },
          ),
        ],
      );
    });
    showDialog(
      barrierDismissible: true,
      context: this,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
