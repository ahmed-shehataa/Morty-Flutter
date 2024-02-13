import 'package:morty_flutter/di/app_module.dart';
import 'package:morty_flutter/splash/presentation/bloc/splash_bloc.dart';

splashModule() async {
  // ui
  getIt.registerFactory(() => SplashBloc(
        getIt.get(),
      ));
}
