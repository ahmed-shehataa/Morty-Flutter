import 'package:morty_flutter/core/theme/constants.dart';
import 'package:morty_flutter/user/domain/repository/user_repository.dart';

class GetThemeUseCase {
  final UserRepository _repository;

  GetThemeUseCase(this._repository);

  AppTheme execute() {
    return _repository.getTheme();
  }
}
