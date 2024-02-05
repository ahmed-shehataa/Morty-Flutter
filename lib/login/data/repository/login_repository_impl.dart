import 'package:morty_flutter/login/data/remote/login_remote_data_source.dart';
import 'package:morty_flutter/login/domain/repository/login_repository.dart';
import 'package:morty_flutter/user/data/model/user_data_model.dart';

class LoginRepositoryImpl implements LoginRepository {

  final LoginRemoteDataSource remote;
  LoginRepositoryImpl(this.remote);

  @override
  Future<UserDataModel> login(String email, String password) async {
    return remote.login(email, password);
  }
}
