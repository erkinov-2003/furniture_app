import 'package:flutter/material.dart';

class CustomProfileCart extends StatelessWidget {
  CustomProfileCart({
    super.key,
    this.subtitle,
    required this.title,
    required this.images,
  });
  final String title;
  final String images;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                    fontFamily: "MerriWeather",
                  ),
                ),
                Image(
                  image: AssetImage(images),
                  height: 30,
                  color: Colors.black38,
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
