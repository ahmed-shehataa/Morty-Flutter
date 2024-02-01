import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_data_model.dart';
import 'user_local_data_source.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  static const String _loggedInKey = "is_logged_in";
  static const String _userKey = "user";
  final SharedPreferences _pref;

  UserLocalDataSourceImpl(this._pref);

  @override
  UserDataModel? getData() {
    var objectAsString = _pref.getString(_userKey) ?? "";
    var json = jsonDecode(objectAsString) as Map<String, dynamic>;
    return UserDataModel.fromJson(json);
  }

  @override
  bool isLoggedIn() {
    return _pref.getBool(_loggedInKey) ?? false;
  }

  @override
  saveData(UserDataModel userDataModel) {
    // TODO remove redundant toJson()
    _pref.setString(_userKey, jsonEncode(userDataModel.toJson()));
  }

  @override
  setLoggedIn() {
    _pref.setBool(_loggedInKey, true);
  }
}
