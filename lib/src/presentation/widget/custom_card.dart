import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.price, required this.images,
  });
  final String title;
  final String price;
  final String images;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(
          height: 220,
          width: 180,
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
        const SizedBox(height: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
                fontFamily: "Gelasio",
              ),
        ),
        const SizedBox(height: 15),
        Text(
          price,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
                fontFamily: "Gelasio",
              ),
        )
      ],
    );
  }
}
