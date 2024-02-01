import 'package:morty_flutter/login/domain/use_case/login_by_email_use_case.dart';
import 'package:morty_flutter/user/data/mapper/user_data_model_mapper.dart';
import 'package:morty_flutter/user/domain/use_case/set_user_data_use_case.dart';

class LoginViewModel {
  final LoginByEmailUseCase _loginByEmailUseCase;
  final SetUserDataUseCase _setUserDataUseCase;

  const LoginViewModel({
    required LoginByEmailUseCase loginByEmailUseCase,
    required SetUserDataUseCase setUserDataUseCase,
  })  : _setUserDataUseCase = setUserDataUseCase,
        _loginByEmailUseCase = loginByEmailUseCase;

  loginByEmail(String email, String password) {
    var user = _loginByEmailUseCase.execute(email, password);
    _setUserDataUseCase.execute(user.toDomainModel());
  }
}
