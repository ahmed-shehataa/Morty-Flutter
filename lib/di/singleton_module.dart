

import 'package:morty_flutter/di/app_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

singletonModule() async {
  // SharedPreferences
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
}