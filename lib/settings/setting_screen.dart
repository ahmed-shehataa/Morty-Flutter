import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
        body: Container());
  }
}
