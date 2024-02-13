import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton(
      {super.key,
      required this.title,
      required void Function() onClicked,
      this.titleColor,
      this.isEnabled = true,
      this.backgroundColor})
      : _onClicked = onClicked;

  final String title;
  final bool isEnabled;
  final Color? titleColor;
  final Color? backgroundColor;
  final VoidCallback _onClicked;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(
      elevation: 2,
      backgroundColor: (backgroundColor != null)
          ? backgroundColor
          : Theme.of(context).colorScheme.error,
      disabledBackgroundColor: Colors.grey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );

    return TextButton(
      style: buttonStyle,
      onPressed: isEnabled ? _onClicked : null,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: (titleColor != null)
                ? titleColor
                : Theme.of(context).colorScheme.onSecondary),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
