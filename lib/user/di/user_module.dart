import 'package:morty_flutter/di/app_module.dart';
import 'package:morty_flutter/user/data/local/user_local_data_source_impl.dart';
import 'package:morty_flutter/user/data/repository/user_repository_impl.dart';
import 'package:morty_flutter/user/domain/use_case/get_user_data_use_case.dart';
import 'package:morty_flutter/user/domain/use_case/set_user_data_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/local/user_local_data_source.dart';
import '../domain/repository/user_repository.dart';

userModule() async {
  // data
  await getIt.isReady<SharedPreferences>();
  getIt.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(getIt.get()));

  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt.get()));

  // domain
  getIt.registerFactory(() => SetUserDataUseCase(getIt.get()));
  getIt.registerFactory(() => GetUserDataUseCase(getIt.get()));

  // ui
}
