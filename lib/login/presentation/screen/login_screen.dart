import 'package:flutter/material.dart';
import 'package:morty_flutter/di/app_module.dart';
import 'package:morty_flutter/login/presentation/viewModel/login_view_model.dart';
import 'package:morty_flutter/util/validation/input_wrapper.dart';
import '../../../morty/presentation/screen/morty_screen.dart';
import '../widgets/login_button.dart';
import '../widgets/login_image.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel loginViewModel = getIt.get();
  var _isEmailValid = false;
  var _isPassValid = false;

  bool _isLoginBtnEnabled() {
    return _isEmailValid && _isPassValid;
  }

  @override
  Widget build(BuildContext context) {
    final emailInputWrapper = InputWrapper(
      FieldType.email,
      "Email",
      TextInputType.emailAddress,
      TextInputAction.next,
      (isEmailValid) {
        setState(() {
          _isEmailValid = isEmailValid;
        });
      },
    );

    final passwordInputWrapper = InputWrapper(
      FieldType.password,
      "Password",
      TextInputType.visiblePassword,
      TextInputAction.done,
      (isPassValid) {
        setState(() {
          _isPassValid = isPassValid;
        });
      },
    );

    return Material(
        child: Center(
            child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoginImage(),
          const SizedBox(height: 10),
          BaseTextField(emailInputWrapper),
          const SizedBox(height: 10),
          BaseTextField(passwordInputWrapper),
          const SizedBox(height: 10),
          LoginButton(_isLoginBtnEnabled(), () {
            print("onLoginCLicked:: " + emailInputWrapper.text);
            loginViewModel.loginByEmail(
                emailInputWrapper.text, passwordInputWrapper.text);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MortyScreen()));
          })
        ],
      ),
    )));
  }
}