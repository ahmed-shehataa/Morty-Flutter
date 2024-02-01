import 'dart:io';

import 'package:morty_flutter/user/data/model/user_data_model.dart';

import 'login_remote_data_source.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  UserDataModel login(String email, String password) {
    sleep(const Duration(seconds:3));
    return UserDataModel(
        id: 101, name: "Ahmed Shehata", email: email, token: "Asdasdasdasdasd");
  }
}
