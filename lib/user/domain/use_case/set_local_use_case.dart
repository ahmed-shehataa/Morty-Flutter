import 'package:morty_flutter/user/domain/repository/user_repository.dart';

class SetLocalUseCase {
  final UserRepository _repository;

  SetLocalUseCase(this._repository);

  execute(String local) {
    _repository.setLocal(local);
  }
}
