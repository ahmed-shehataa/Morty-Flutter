import 'package:morty_flutter/login/domain/repository/login_repository.dart';
import 'package:morty_flutter/user/data/model/user_data_model.dart';

class LoginByEmailUseCase {
  final LoginRepository _repository;

  LoginByEmailUseCase(this._repository);

  Future<UserDataModel> execute(String email, String password) async {
    return _repository.login(email, password);
  }
}
