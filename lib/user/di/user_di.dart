import 'package:morty_flutter/login/data/remote/login_remote_data_source_impl.dart';
import 'package:morty_flutter/login/data/repository/login_repository_impl.dart';
import 'package:morty_flutter/login/domain/use_case/login_by_email_use_case.dart';
import 'package:morty_flutter/login/presentation/viewModel/login_view_model.dart';
import 'package:morty_flutter/user/data/local/user_local_data_source_impl.dart';
import 'package:morty_flutter/user/data/repository/user_repository_impl.dart';
import 'package:morty_flutter/user/domain/use_case/get_user_data_use_case.dart';
import 'package:morty_flutter/user/domain/use_case/set_user_data_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDI {

  static late final SharedPreferences prefs;

  static Future<SharedPreferences> init() async =>
      prefs = await SharedPreferences.getInstance();

  static SetUserDataUseCase getSetUserDataUseCase() {
    var local = UserLocalDataSourceImpl(prefs);
    var repo = UserRepositoryImpl(local);
    return SetUserDataUseCase(repo);
  }

  static GetUserDataUseCase getUserDataUseCase() {
    var local = UserLocalDataSourceImpl(prefs);
    var repo = UserRepositoryImpl(local);
    return GetUserDataUseCase(repo);
  }
}
