import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morty_flutter/user/domain/use_case/get_is_logged_in_use_case.dart';

import '../contract/splash_state.dart';

class SplashBloc extends Bloc<Object, SplashState?> {
  final GetIsLoggedInUseCase _getIsLoggedInUseCase;

  SplashBloc(
    this._getIsLoggedInUseCase,
  ) : super(null) {
    print("SplashBloc:: init");
    final bool isLoggedIn = _getIsLoggedInUseCase.execute();
    if (isLoggedIn) {
      emit(OpenHomeScreenState());
    } else {
      emit(OpenLoginScreenState());
    }
  }
}
