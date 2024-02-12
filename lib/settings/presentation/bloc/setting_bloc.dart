import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morty_flutter/core/local/constants.dart';
import 'package:morty_flutter/settings/presentation/contract/setting_event.dart';
import 'package:morty_flutter/user/domain/use_case/get_local_use_case.dart';
import 'package:morty_flutter/user/domain/use_case/set_local_use_case.dart';
import 'package:sqflite/sqflite.dart';

import '../../../user/domain/use_case/get_theme_use_case.dart';
import '../../../user/domain/use_case/set_theme_use_case.dart';
import '../../../user/domain/use_case/set_user_logout_use_case.dart';
import '../contract/setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final SetUserLogoutUseCase _setUserLogoutUseCase;
  final GetLocalUseCase _getLocalUseCase;
  final SetLocalUseCase _setLocalUseCase;
  final SetThemeUseCase _setThemeUseCase;
  final GetThemeUseCase _getThemeUseCase;
  final Database database;

  SettingBloc(this._setUserLogoutUseCase, this._getLocalUseCase,
      this._setLocalUseCase, this._setThemeUseCase, this._getThemeUseCase, this.database)
      : super(SettingState(
            appLocal: _getLocalUseCase.execute(),
            appTheme: _getThemeUseCase.execute())) {
    on<LogoutEvent>(
      (event, emit) {
        _setUserLogoutUseCase.execute();
        emit(state.copy(isLoggedOut: true));
      },
    );
    on<ChangeAppLocalEvent>(
      (event, emit) {
        _setLocalUseCase.execute(event.appLocale);
      },
    );
    on<ChangeAppThemeEvent>(
      (event, emit) {},
    );
    on<ClearCacheEvent>(
      (event, emit) {
        database.delete(mortyTableName);
      },
    );
  }
}
