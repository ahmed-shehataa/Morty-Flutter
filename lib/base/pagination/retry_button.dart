import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RetryButton extends StatelessWidget {
  const RetryButton(this._onClicked, {super.key});

  final VoidCallback _onClicked;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(
      elevation: 2,
      backgroundColor: Theme.of(context).colorScheme.error,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );

    return TextButton(
      style: buttonStyle,
      onPressed: _onClicked,
      child: Text(
        "retry".tr(),
        style: const TextStyle(color: Colors.white),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
