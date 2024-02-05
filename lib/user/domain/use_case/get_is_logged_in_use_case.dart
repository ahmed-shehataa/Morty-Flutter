import 'package:morty_flutter/user/domain/repository/user_repository.dart';

class GetIsLoggedInUseCase {
  final UserRepository _repository;

  GetIsLoggedInUseCase(this._repository);

  bool execute() {
    return _repository.isLoggedIn();
  }
}
