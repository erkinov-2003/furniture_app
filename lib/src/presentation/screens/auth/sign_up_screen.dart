import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/validation/sign_up_validator.dart';
import 'package:furniture_app/src/service/auth_service.dart';
import '../../../core/constants/app_colors.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_driver.dart';
import '../../widget/custom_text_fild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  void signUpFirebase() async {
    final authService = FurnitureAuthService();
    try {
      await authService.signUpFirebase(
        nameController.text,
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      throw Exception("Error sign up buttons");
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: globalKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomDriver(),
                SizedBox(height: size.height * 0.020),
                Text(
                  "WELCOME",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppColors.black,
                        fontFamily: "MerriWeather",
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: size.height * 0.030),
                CustomTextField(
                  controller: nameController,
                  labelText: "Name",
                  textInputType: TextInputType.name,
                  validator: (values) =>
                      SignUpValidation.nameValidation(values!),
                ),
                SizedBox(height: size.height * 0.030),
                CustomTextField(
                  controller: emailController,
                  labelText: "Email",
                  textInputType: TextInputType.emailAddress,
                  validator: (value) =>
                      SignUpValidation.emailValidation(value!),
                ),
                SizedBox(height: size.height * 0.040),
                CustomTextField(
                  controller: passwordController,
                  labelText: "Password",
                  textInputType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (passwordController.text.trim() !=
                        confirmPasswordController.text.trim()) {
                      return "Iltimos parollarni bir xil yozing!";
                    }
                    return SignUpValidation.passwrodValidation(value!);
                  },
                ),
                SizedBox(height: size.height * 0.050),
                CustomTextField(
                  controller: confirmPasswordController,
                  labelText: "Confirm Password",
                  textInputType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (passwordController.text.trim() !=
                        confirmPasswordController.text.trim()) {
                      return "Iltimos parollarni bir xil yozing!";
                    }
                    return SignUpValidation.passwrodValidation(value!);
                  },
                ),
                SizedBox(height: size.height * 0.070),
                CustomScreenBottom(
                  onPressed: () {
                    if (globalKey.currentState!.validate()) {
                      signUpFirebase();
                    }
                  },
                  buttonText: "Log in",
                  size: Size(size.width * 0.895, size.height * 0.070),
                ),
                SizedBox(height: size.height * 0.040),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have account?",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.grey,
                              fontFamily: "Nunito",
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      SizedBox(width: size.width * 0.020),
                      TextButton(
                        onPressed: widget.onPressed,
                        child: Text(
                          "SIGN IN",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColors.black,
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
