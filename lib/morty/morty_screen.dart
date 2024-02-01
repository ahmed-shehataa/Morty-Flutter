import 'package:flutter/material.dart';

import '../user/di/user_di.dart';

class MortyScreen extends StatelessWidget {
  const MortyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text(UserDI.getUserDataUseCase().execute()?.name ?? ""),
    );
  }
}
