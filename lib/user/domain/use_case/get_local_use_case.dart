import 'dart:ui';

import 'package:morty_flutter/user/domain/repository/user_repository.dart';

class GetLocalUseCase {
  final UserRepository _repository;

  GetLocalUseCase(this._repository);

  Locale execute() {
    return _repository.getLocal();
  }
}
