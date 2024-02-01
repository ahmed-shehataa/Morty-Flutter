import 'package:morty_flutter/user/domain/model/user_domain_model.dart';
import 'package:morty_flutter/user/domain/repository/user_repository.dart';

class SetUserDataUseCase {
  final UserRepository _repository;

  SetUserDataUseCase(this._repository);

  UserDomainModel? execute(UserDomainModel userDomainModel) {
    return _repository.saveUserData(userDomainModel);
  }
}
