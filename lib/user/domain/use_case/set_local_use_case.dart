import 'dart:ui';

import 'package:morty_flutter/user/domain/repository/user_repository.dart';

class SetLocalUseCase {
  final UserRepository _repository;

  SetLocalUseCase(this._repository);

  execute(Locale local) {
    _repository.setLocal(local);
  }
}
