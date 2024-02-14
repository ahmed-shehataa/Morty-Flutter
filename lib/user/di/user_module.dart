import 'package:morty_flutter/di/app_module.dart';
import 'package:morty_flutter/user/data/local/user_local_data_source_impl.dart';
import 'package:morty_flutter/user/data/repository/user_repository_impl.dart';
import 'package:morty_flutter/user/domain/use_case/get_is_logged_in_use_case.dart';
import 'package:morty_flutter/user/domain/use_case/get_local_use_case.dart';
import 'package:morty_flutter/user/domain/use_case/get_theme_use_case.dart';
import 'package:morty_flutter/user/domain/use_case/get_user_data_use_case.dart';
import 'package:morty_flutter/user/domain/use_case/set_is_logged_in_use_case.dart';
import 'package:morty_flutter/user/domain/use_case/set_local_use_case.dart';
import 'package:morty_flutter/user/domain/use_case/set_theme_use_case.dart';
import 'package:morty_flutter/user/domain/use_case/set_user_data_use_case.dart';
import 'package:morty_flutter/user/domain/use_case/set_user_logout_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../data/local/user_local_data_source.dart';
import '../domain/repository/user_repository.dart';

userModule() async {
  // data
  await getIt.isReady<SharedPreferences>();
  await getIt.isReady<Database>();
  getIt.registerSingleton<UserLocalDataSource>(
      UserLocalDataSourceImpl(getIt.get()));

  getIt.registerSingleton<UserRepository>(UserRepositoryImpl(getIt.get()));

  // domain
  getIt.registerFactory(() => SetUserDataUseCase(getIt.get()));
  getIt.registerFactory(() => GetUserDataUseCase(getIt.get()));
  getIt.registerFactory(() => SetUserLogoutUseCase(getIt.get()));
  getIt.registerFactory(() => GetIsLoggedInUseCase(getIt.get()));
  getIt.registerFactory(() => SetIsLoggedInUseCase(getIt.get()));
  getIt.registerFactory(() => SetLocalUseCase(getIt.get()));
  getIt.registerFactory(() => GetLocalUseCase(getIt.get()));
  getIt.registerFactory(() => GetThemeUseCase(getIt.get()));
  getIt.registerFactory(() => SetThemeUseCase(getIt.get()));
}
