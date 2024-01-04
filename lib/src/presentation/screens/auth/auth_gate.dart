import 'package:flutter/material.dart';
import 'package:furniture_app/src/presentation/screens/page_builder/page_builder.dart';
import 'package:furniture_app/src/service/auth_service.dart';

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
          return const PageBuilder();
        } else {
          return const SwitchPages();
        }
      },
    );
  }
}
