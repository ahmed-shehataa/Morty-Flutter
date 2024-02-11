import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:morty_flutter/core/localization/constants.dart';
import 'package:morty_flutter/core/theme/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_data_model.dart';
import 'user_local_data_source.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  static const String _loggedInKey = "is_logged_in";
  static const String _userKey = "user";
  static const String _local = "local";
  static const String _theme = "theme";
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

  @override
  logout() {
    _pref.setBool(_loggedInKey, false);
    _pref.setString(_userKey, "");
  }

  @override
  String getLocal() {
    debugPrint("getLocal:: $defaultLocal");
    return _pref.getString(_local) ?? defaultLocal.toString();
  }

  @override
  setLocal(String local) {
    _pref.setString(_local, local);
  }

  @override
  AppTheme getTheme() {
    final String themeName = _pref.getString(_theme) ?? defaultTheme.name;
    return AppTheme.getType(themeName);
  }

  @override
  setTheme(AppTheme appTheme) {
    _pref.setString(_theme, appTheme.name);
  }
}
