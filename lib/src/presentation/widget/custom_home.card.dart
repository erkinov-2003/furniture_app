import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';


class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.price,
    required this.images,
  });
  final String title;
  final String price;
  final String images;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.261,
          width: size.width * 0.459,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFFe4e5e6),
              image: DecorationImage(
                image: AssetImage(images),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.012),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
                fontFamily: "Gelasio",
              ),
        ),
        SizedBox(height: size.height * 0.020),
        Text(
          price,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
                fontFamily: "Gelasio",
              ),
        ),
      ],
    );
  }
}
