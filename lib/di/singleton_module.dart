

import 'package:dio/dio.dart';
import 'package:morty_flutter/di/app_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/client/dio_client.dart';

singletonModule() async {
  // SharedPreferences
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  // dio
  getIt.registerLazySingleton<Dio>(() => DioClient.getInstance());

}