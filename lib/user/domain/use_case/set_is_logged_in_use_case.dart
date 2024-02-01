import 'package:morty_flutter/user/domain/repository/user_repository.dart';

class SetIsLoggedInUseCase {
  final UserRepository _repository;

  SetIsLoggedInUseCase(this._repository);

  execute() {
    _repository.setLoggedIn();
  }
}
