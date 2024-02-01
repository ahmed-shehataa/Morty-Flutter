import 'package:flutter/material.dart';
import 'package:morty_flutter/splash/presentation/screen/splash_screen.dart';
import 'package:morty_flutter/user/di/user_di.dart';

import 'morty/morty_screen.dart';

void main() async {
  // Required for async calls in `main`
  WidgetsFlutterBinding.ensureInitialized();
  await UserDI.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MortyScreen(),
    );
  }
}
