import '../../../core/theme/constants.dart';
import '../model/user_domain_model.dart';

abstract class UserRepository {
  setLoggedIn();

  logout();

  setLocal(String local);

  setTheme(AppTheme appTheme);

  AppTheme getTheme();

  String getLocal();

  bool isLoggedIn();

  saveUserData(UserDomainModel userDomainModel);

  UserDomainModel? getUserData();
}
