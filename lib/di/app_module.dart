import 'package:get_it/get_it.dart';
import 'package:morty_flutter/di/singleton_module.dart';

import '../login/di/login_module.dart';
import '../morty/di/morty_module.dart';
import '../user/di/user_module.dart';

final getIt = GetIt.instance;

initGetIT() async {
  await singletonModule();
  await userModule();
  await loginModule();
  await mortyModule();
}
