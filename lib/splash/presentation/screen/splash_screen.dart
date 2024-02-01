import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morty_flutter/login/presentation/screen/login_screen.dart';
import 'package:morty_flutter/util/images/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    });

    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Center(
          child: SvgPicture.asset(
            ImagesRes.splash,
          ),
        )
      ],
    );
  }
}
