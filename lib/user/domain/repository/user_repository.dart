import '../model/user_domain_model.dart';

abstract class UserRepository {
  setLoggedIn();

  bool isLoggedIn();

  saveUserData(UserDomainModel userDomainModel);

  UserDomainModel? getUserData();
}
