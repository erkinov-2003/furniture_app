import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';

class CustomScreenBottom extends StatelessWidget {
  const CustomScreenBottom({
    super.key,
    required this.buttonText,
    this.onPressed,
    required this.size,
  });
  final String buttonText;
  final void Function()? onPressed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        fixedSize: size,
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontFamily: "Gelasio",
            ),
      ),
    );
  }
}
