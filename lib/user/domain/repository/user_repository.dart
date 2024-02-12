import 'dart:ui';

import '../../../core/theme/constants.dart';
import '../model/user_domain_model.dart';

abstract class UserRepository {
  setLoggedIn();

  logout();

  setLocal(Locale local);

  setTheme(AppTheme appTheme);

  AppTheme getTheme();

  Locale getLocal();

  bool isLoggedIn();

  saveUserData(UserDomainModel userDomainModel);

  UserDomainModel? getUserData();
}
