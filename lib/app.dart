import 'package:flutter/material.dart';
import 'package:morty_flutter/morty/presentation/screen/morty_screen.dart';

import 'di/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIT();
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
