import 'package:morty_flutter/core/theme/constants.dart';
import 'package:morty_flutter/user/data/local/user_local_data_source.dart';
import 'package:morty_flutter/user/data/mapper/user_data_model_mapper.dart';
import 'package:morty_flutter/user/domain/model/user_domain_model.dart';
import 'package:morty_flutter/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _local;

  UserRepositoryImpl(this._local);

  @override
  UserDomainModel? getUserData() {
    return _local.getData().toDomainModel();
  }

  @override
  bool isLoggedIn() {
    return _local.isLoggedIn();
  }

  @override
  saveUserData(UserDomainModel userDomainModel) {
    _local.saveData(userDomainModel.toDataModel());
  }

  @override
  setLoggedIn() {
    _local.setLoggedIn();
  }

  @override
  logout() {
    _local.logout();
  }

  @override
  String getLocal() {
    return _local.getLocal();
  }

  @override
  setLocal(String local) {
    _local.setLocal(local);
  }

  @override
  AppTheme getTheme() {
    return _local.getTheme();
  }

  @override
  setTheme(AppTheme appTheme) {
    _local.setTheme(appTheme);
  }
}
