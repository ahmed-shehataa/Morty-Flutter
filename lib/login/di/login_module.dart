import 'package:morty_flutter/login/data/remote/login_remote_data_source_impl.dart';
import 'package:morty_flutter/login/data/repository/login_repository_impl.dart';
import 'package:morty_flutter/login/domain/use_case/login_by_email_use_case.dart';

import '../../di/app_module.dart';
import '../data/remote/login_remote_data_source.dart';
import '../domain/repository/login_repository.dart';
import '../presentation/notifier/login_provider.dart';

loginModule() {
  // data
  getIt.registerFactory<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl());

  getIt
      .registerFactory<LoginRepository>(() => LoginRepositoryImpl(getIt.get()));

  // domain
  getIt.registerFactory(() => LoginByEmailUseCase(getIt.get()));

  // ui
  getIt.registerFactory(() => LoginNotifier(getIt.get(), getIt.get()));
}
