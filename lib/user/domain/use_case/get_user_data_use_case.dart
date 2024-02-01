import 'package:morty_flutter/user/domain/model/user_domain_model.dart';
import 'package:morty_flutter/user/domain/repository/user_repository.dart';

class GetUserDataUseCase {
  final UserRepository _repository;

  GetUserDataUseCase(this._repository);

  UserDomainModel? execute() {
    return _repository.getUserData();
  }
}
