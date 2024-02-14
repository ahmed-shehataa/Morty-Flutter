import 'package:flutter/material.dart';
import 'package:morty_flutter/core/widgets/extensions/dialogs.dart';
import 'package:morty_flutter/di/app_module.dart';
import 'package:provider/provider.dart';

import '../../../morty/presentation/screen/morty_screen.dart';
import '../notifier/login_provider.dart';
import '../widgets/login_button.dart';
import '../widgets/login_image.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).colorScheme.background,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ChangeNotifierProvider<LoginNotifier>(
            create: (context) => getIt.get(),
            child: Consumer<LoginNotifier>(
              builder:
                  (BuildContext context, LoginNotifier value, Widget? child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LoginImage(),
                    const SizedBox(height: 10),
                    BaseTextField(value.emailInputWrapper),
                    const SizedBox(height: 10),
                    BaseTextField(value.passwordInputWrapper),
                    const SizedBox(height: 10),
                    LoginButton(value.isLoginBtnEnabled(), () async {
                      context.showLoadingDialog();
                      await value.loginByEmail();
                      context.hideLoadingDialog();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MortyScreen()));
                    })
                  ],
                );
              },
            ),
          ),
        )));
  }
}
