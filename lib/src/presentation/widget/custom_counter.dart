import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/core/constants/app_icons.dart';

class CustomCounter extends StatelessWidget {
  const CustomCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => {},
          child: const SizedBox(
            height: 28,
            width: 28,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFf3f3f3),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(AppIcons.plusIcon),
                  height: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          "01",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.black,
                fontFamily: "Gelios",
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () => {},
          child: const SizedBox(
            height: 28,
            width: 28,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFf3f3f3),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(AppIcons.minusIcon),
                  height: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
