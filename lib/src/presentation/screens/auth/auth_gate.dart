import 'package:flutter/material.dart';
import 'package:furniture_app/src/service/auth_service.dart';

import '../home/home_screen.dart';
import 'switch_pages.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = FurnitureAuthService();
    return StreamBuilder(
      stream: authService.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const SwitchPages();
        }
      },
    );
  }
}
