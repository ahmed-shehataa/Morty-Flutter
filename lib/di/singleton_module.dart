import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:morty_flutter/core/local/sql_lite.dart';
import 'package:morty_flutter/di/app_module.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../core/network/client/dio_client.dart';

singletonModule() async {
  // SharedPreferences
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  // dio
  getIt.registerLazySingleton<Dio>(() => DioClient.getInstance());

  // sqflite
  getIt.registerSingletonAsync<Database>(
    () async {
      return await SqliteService.initializeDB();
    },
  );

  // InternetConnectionChecker
  getIt.registerSingleton<InternetConnectionChecker>(
      InternetConnectionChecker());
}
