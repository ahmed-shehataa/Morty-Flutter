import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morty_flutter/login/presentation/screen/login_screen.dart';

import '../../../core/common/constants/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 20), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    });

    return Container(
      color: Colors.white,
      child: Center(
        child: SvgPicture.asset(
          SvgRes.splash,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
