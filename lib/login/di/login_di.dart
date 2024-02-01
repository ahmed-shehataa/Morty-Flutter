import 'package:morty_flutter/login/data/remote/login_remote_data_source_impl.dart';
import 'package:morty_flutter/login/data/repository/login_repository_impl.dart';
import 'package:morty_flutter/login/domain/use_case/login_by_email_use_case.dart';
import 'package:morty_flutter/login/presentation/viewModel/login_view_model.dart';
import '../../user/di/user_di.dart';

class LoginDI {
  static LoginViewModel getLoginVM() {
    var remote = LoginRemoteDataSourceImpl();
    var repo = LoginRepositoryImpl(remote);
    var loginByEmailUseCase = LoginByEmailUseCase(repo);
    return LoginViewModel(
        loginByEmailUseCase: loginByEmailUseCase,
        setUserDataUseCase: UserDI.getSetUserDataUseCase());
  }
}
