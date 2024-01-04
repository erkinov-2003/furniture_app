import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/core/constants/app_images.dart';

class CustomDriver extends StatelessWidget {
  const CustomDriver({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 15),
            child: SizedBox(
              height: 1,
              child: ColoredBox(
                color: AppColors.grey,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 70,
          width: 70,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey, width: 0.4),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Image(
                image: AssetImage(AppImages.signInImages),
                height: 50,
              ),
            ),
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: SizedBox(
              height: 1,
              child: ColoredBox(
                color: AppColors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
