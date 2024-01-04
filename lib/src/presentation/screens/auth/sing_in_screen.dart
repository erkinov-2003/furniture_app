import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/presentation/widget/custom_button.dart';
import 'package:furniture_app/src/presentation/widget/custom_driver.dart';
import 'package:furniture_app/src/presentation/widget/custom_text_fild.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomDriver(),
              SizedBox(height: size.height * 0.040),
              Text(
                "HEllO!",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppColors.grey,
                      fontFamily: "MerriWeather",
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(height: size.height * 0.020),
              Text(
                "WELCOME BACK",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppColors.black,
                      fontFamily: "MerriWeather",
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: size.height * 0.030),
              CustomTextField(
                controller: emailController,
                labelText: "Email",
              ),
              SizedBox(height: size.height * 0.040),
              CustomTextField(
                controller: passwordController,
                labelText: "Password",
              ),
              SizedBox(height: size.height * 0.050),
              Center(
                child: Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.black,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              SizedBox(height: size.height * 0.050),
              CustomScreenBottom(
                onPressed: () => mainController.signInButton(
                  emailController,
                  passwordController,
                  context,
                ),
                buttonText: "Log in",
                size: Size(size.width * 0.895, size.height * 0.070),
              ),
              SizedBox(height: size.height * 0.040),
              Center(
                child: TextButton(
                  onPressed: widget.onPressed,
                  child: Text(
                    "SIGN UP",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.black,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
