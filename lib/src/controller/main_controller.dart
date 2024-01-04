import 'package:flutter/material.dart';
import 'package:furniture_app/src/service/auth_service.dart';

class MainController extends ChangeNotifier {
  final service = FurnitureAuthService();

  bool switchPage = true;

  void switchButton() {
    switchPage = !switchPage;
    notifyListeners();
  }

  void navigatorPage(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
