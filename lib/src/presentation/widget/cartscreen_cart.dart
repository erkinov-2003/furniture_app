import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import 'custom_counter.dart';

class CustomCartScreen extends StatelessWidget {
  const CustomCartScreen({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });
  final String title, price, image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.106,
              width: size.width * 0.229,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme!.titleMedium!.copyWith(
                          color: Colors.black,
                          fontFamily: "MerriWeather",
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: size.height * 0.010),
                  Text(
                   price,
                    style: Theme.of(context).textTheme!.titleMedium!.copyWith(
                          color: Colors.black,
                          fontFamily: "MerriWeather",
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 20),
                  const CustomCounter(),
                ],
              ),
            ),
            const Spacer(flex: 5),
            GestureDetector(
              onTap: () {

              },
              child: SizedBox(
                height: size.height * size.height * 0.032,
                width: size.width * 0.060,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image(
                      image: AssetImage(AppIcons.clearIcon),
                      height: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
