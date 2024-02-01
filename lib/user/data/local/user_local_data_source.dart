import '../model/user_data_model.dart';

abstract class UserLocalDataSource {
  setLoggedIn();

  bool isLoggedIn();

  saveData(UserDataModel userDataModel);

  UserDataModel? getData();
}
