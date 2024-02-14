import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morty_flutter/di/app_module.dart';
import 'package:morty_flutter/login/presentation/screen/login_screen.dart';
import 'package:morty_flutter/morty/presentation/screen/morty_screen.dart';
import 'package:morty_flutter/splash/presentation/bloc/splash_bloc.dart';
import 'package:morty_flutter/splash/presentation/contract/splash_state.dart';

import '../../../core/common/constants/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SplashBloc>(),
      child: BlocListener<SplashBloc, SplashState?>(
        listener: (context, state) {
          Widget navigateTo;
          switch (state) {
            case OpenLoginScreenState():
              navigateTo = const LoginScreen();
            case OpenHomeScreenState():
              navigateTo = const MortyScreen();
            default:
              navigateTo = const LoginScreen();
          }
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => navigateTo,
              ));
        },
        child: Container(
          color: Colors.white,
          child: Center(
            child: SvgPicture.asset(
              SvgRes.splash,
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}
