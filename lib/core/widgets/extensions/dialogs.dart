import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../common/constants/gif.dart';
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
  showLogoutDialog() {
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
        BaseButton(title: "logout".tr(), onClicked: hideLogoutDialog),
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
