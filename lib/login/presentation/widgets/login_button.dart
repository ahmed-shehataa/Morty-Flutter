import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/widgets/base_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(this._isEnabled, this._onLogin, {super.key});

  final bool _isEnabled;
  final VoidCallback _onLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58,
      child: BaseButton(
        title: "login".tr(),
        isEnabled: _isEnabled,
        onClicked: _onLogin,
        titleColor: Theme.of(context).colorScheme.onSecondary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
