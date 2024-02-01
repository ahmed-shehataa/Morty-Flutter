import 'package:morty_flutter/user/data/model/user_data_model.dart';
import 'package:morty_flutter/user/domain/model/user_domain_model.dart';

extension UserDomainModelMapper on UserDomainModel? {

  UserDataModel toDataModel() {
    return UserDataModel(
      id: this?.id ?? 0,
      name: this?.name ?? "",
      token: this?.token ?? "",
      email: this?.email ?? "",
    );
  }

}


extension UserDataModelMapper on UserDataModel? {

  UserDomainModel toDomainModel() {
    return UserDomainModel(
      id: this?.id ?? 0,
      name: this?.name ?? "",
      token: this?.token ?? "",
      email: this?.email ?? "",
    );
  }

}