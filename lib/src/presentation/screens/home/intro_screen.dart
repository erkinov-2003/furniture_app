import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/core/constants/app_images.dart';
import 'package:furniture_app/src/presentation/screens/auth/sing_in_screen.dart';
import 'package:furniture_app/src/presentation/widget/custom_button.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.backgroundImg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 4),
                Text(
                  "MAKE YOUR",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Gelasio",
                      ),
                ),
                SizedBox(height: size.height * 0.020),
                Text(
                  "HOME BEAUTIFUL",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Gelasio",
                      ),
                ),
                SizedBox(height: size.height * 0.040),
                Text(
                  "The best simple place where you discover most wonderful furnitures and make your home beautiful",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Nunito",
                      ),
                ),
                const Spacer(flex: 4),
                Center(
                  child: CustomScreenBottom(
                    onPressed: () => mainController.navigatorPage(
                      context,
                      SignInScreen(onPressed: () {}),
                    ),
                    buttonText: "Get Started",
                    size: Size(size.width * 0.392, size.height * 0.059),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
