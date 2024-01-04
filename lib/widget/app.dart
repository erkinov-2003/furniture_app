import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:furniture_app/src/presentation/screens/auth/auth_gate.dart';
import 'package:provider/provider.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainController(),
      builder: (context, child) =>  MaterialApp(
        theme: ThemeData(useMaterial3: false),
        title: "Furniture app",
        debugShowCheckedModeBanner: false,
        home:  const AuthGate()
      )
    );
  }
}
