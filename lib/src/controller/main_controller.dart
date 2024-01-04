import 'package:flutter/material.dart';
import 'package:furniture_app/src/service/auth_service.dart';

class MainController extends ChangeNotifier {
  final service = FurnitureAuthService();

  bool switchPage = true;

  void switchButton() {
    switchPage =! switchPage;
    notifyListeners();
  }

  void navigatorPage(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  Future<void> signInButton(
    TextEditingController email,
    password,
    BuildContext context,
  ) async {
    if (email.text.isEmpty || password.text.isEmty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Iltimos bo'sh qoldirmasangiz!"),
          backgroundColor: Colors.blue,
          elevation: 10,
          action: SnackBarAction(
            label: "Ok",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
      await service.signInFirebase(email.text, password.text);
    }
  }

  Future<void> signUpButton(
    TextEditingController name,
    email,
    password,
    confirmPassword,
    BuildContext context,
  ) async {
    if (password.text != confirmPassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Iltimos passoword bir xil yozing!"),
          backgroundColor: Colors.blue,
          elevation: 10,
          action: SnackBarAction(
            label: "Ok",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          padding: const EdgeInsets.all(10),
        ),
      );
    }
  }
}
