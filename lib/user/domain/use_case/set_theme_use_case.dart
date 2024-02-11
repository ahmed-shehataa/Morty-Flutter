import 'package:morty_flutter/core/theme/constants.dart';
import 'package:morty_flutter/user/domain/repository/user_repository.dart';

class SetThemeUseCase {
  final UserRepository _repository;

  SetThemeUseCase(this._repository);

  execute(AppTheme appTheme) {
    _repository.setTheme(appTheme);
  }
}
