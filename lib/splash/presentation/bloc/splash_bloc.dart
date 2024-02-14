import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morty_flutter/user/domain/use_case/get_is_logged_in_use_case.dart';

import '../contract/splash_event.dart';
import '../contract/splash_state.dart';

class SplashBloc extends Bloc<GetNextScreenEvent, SplashState?> {
  final GetIsLoggedInUseCase _getIsLoggedInUseCase;

  SplashBloc(
    this._getIsLoggedInUseCase,
  ) : super(null) {
    on<GetNextScreenEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      final bool isLoggedIn = _getIsLoggedInUseCase.execute();
      if (isLoggedIn) {
        emit(OpenHomeScreenState());
      } else {
        emit(OpenLoginScreenState());
      }
    });

    add(GetNextScreenEvent());
  }
}
