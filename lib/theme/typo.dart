import 'package:flutter/material.dart';

TextTheme getTextTheme(BuildContext context) {
  return TextTheme(
    bodySmall: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 14,
        fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 18,
        fontWeight: FontWeight.normal),
    bodyLarge: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 20,
        fontWeight: FontWeight.normal),
    labelSmall: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 12,
        fontWeight: FontWeight.normal),
    labelMedium: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 14,
        fontWeight: FontWeight.normal),
    labelLarge: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 18,
        fontWeight: FontWeight.normal),
    displaySmall: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 20,
        fontWeight: FontWeight.normal),
    displayMedium: TextStyle(
        color: Theme.of(context).colorScheme.onSecondary,
        fontSize: 24,
        fontWeight: FontWeight.normal),
    displayLarge: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 34,
        fontWeight: FontWeight.bold),
  );
}
