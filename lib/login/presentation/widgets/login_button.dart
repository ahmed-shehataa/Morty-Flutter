import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(this._isEnabled, this._onLogin, {super.key});

  final bool _isEnabled;
  final VoidCallback _onLogin;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(
      elevation: 2,
      backgroundColor: Colors.purple,
      disabledBackgroundColor: Colors.grey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
    );

    return Container(
      width: double.infinity,
      height: 50,
      child: TextButton(
        style: buttonStyle,
        onPressed: _isEnabled ? _onLogin : null,
        child: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
