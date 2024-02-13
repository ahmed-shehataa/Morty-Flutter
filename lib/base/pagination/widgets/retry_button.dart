import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/widgets/base_button.dart';

class RetryButton extends StatelessWidget {
  const RetryButton(this._onClicked, {super.key});

  final VoidCallback _onClicked;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      title: "retry".tr(),
      onClicked: _onClicked,
    );
  }
}
