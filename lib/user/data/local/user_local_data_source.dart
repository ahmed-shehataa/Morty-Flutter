import 'package:morty_flutter/core/theme/constants.dart';

import '../model/user_data_model.dart';

abstract class UserLocalDataSource {
  setLoggedIn();

  setLocal(String local);

  String getLocal();

  setTheme(AppTheme appTheme);

  AppTheme getTheme();

  logout();

  bool isLoggedIn();

  saveData(UserDataModel userDataModel);

  UserDataModel? getData();
}
