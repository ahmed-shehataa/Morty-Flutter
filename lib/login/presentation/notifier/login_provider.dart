import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morty_flutter/user/data/mapper/user_data_model_mapper.dart';
import 'package:morty_flutter/user/domain/use_case/set_is_logged_in_use_case.dart';

import '../../../core/validation/input_wrapper.dart';
import '../../../user/domain/use_case/set_user_data_use_case.dart';
import '../../domain/use_case/login_by_email_use_case.dart';

class LoginNotifier extends ChangeNotifier {
  final LoginByEmailUseCase _loginByEmailUseCase;
  final SetUserDataUseCase _setUserDataUseCase;
  final SetIsLoggedInUseCase _setIsLoggedInUseCase;

  late InputWrapper emailInputWrapper;
  late InputWrapper passwordInputWrapper;

  var _isEmailValid = false;
  var _isPassValid = false;
  var isLoading = false;

  LoginNotifier(this._loginByEmailUseCase, this._setUserDataUseCase, this._setIsLoggedInUseCase) {
    emailInputWrapper = InputWrapper(
      FieldType.email,
      "email".tr(),
      TextInputType.emailAddress,
      TextInputAction.next,
      (isEmailValid) {
        _isEmailValid = isEmailValid;
        notifyListeners();
      },
    );

    passwordInputWrapper = InputWrapper(
      FieldType.password,
      "password".tr(),
      TextInputType.visiblePassword,
      TextInputAction.done,
      (isPassValid) {
        _isPassValid = isPassValid;
        notifyListeners();
      },
    );
  }

  bool isLoginBtnEnabled() {
    return _isEmailValid && _isPassValid;
  }

  loginByEmail() async {
    isLoading = true;
    var user = await _loginByEmailUseCase.execute(
        emailInputWrapper.text, passwordInputWrapper.text);
    _setUserDataUseCase.execute(user.toDomainModel());
    _setIsLoggedInUseCase.execute();
    isLoading = false;
  }
}
