import 'package:morty_flutter/di/app_module.dart';
import 'package:morty_flutter/settings/presentation/bloc/setting_bloc.dart';

settingModule() async {
  // ui
  getIt.registerFactory(() => SettingBloc(
        getIt.get(),
        getIt.get(),
        getIt.get(),
        getIt.get(),
        getIt.get(),
      ));
}
