import 'package:morty_flutter/user/data/model/user_data_model.dart';

abstract class LoginRepository {
  Future<UserDataModel> login(String email, String password);
}
