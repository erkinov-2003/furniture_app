import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:provider/provider.dart';

import 'sign_up_screen.dart';
import 'sing_in_screen.dart';

class SwitchPages extends StatefulWidget {
  const SwitchPages({super.key});

  @override
  State<SwitchPages> createState() => _SwitchPagesState();
}



class _SwitchPagesState extends State<SwitchPages> {
  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    if (mainController.switchPage) {
      return SignInScreen(
        onPressed: mainController.switchButton,
      );
    }
    return SignUpScreen(
      onPressed: mainController.switchButton,
    );
  }
}
