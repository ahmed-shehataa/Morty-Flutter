import 'package:morty_flutter/user/data/local/user_local_data_source.dart';
import 'package:morty_flutter/user/data/mapper/user_data_model_mapper.dart';
import 'package:morty_flutter/user/domain/model/user_domain_model.dart';
import 'package:morty_flutter/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource local;

  UserRepositoryImpl(this.local);

  @override
  UserDomainModel? getUserData() {
    return local.getData().toDomainModel();
  }

  @override
  bool isLoggedIn() {
    return local.isLoggedIn();
  }

  @override
  saveUserData(UserDomainModel userDomainModel) {
    local.saveData(userDomainModel.toDataModel());
  }

  @override
  setLoggedIn() {
    local.setLoggedIn();
  }
}
