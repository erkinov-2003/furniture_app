import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/data/model/card_model.dart';
import 'package:furniture_app/src/presentation/screens/dialog/home_cart_dialog.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_icons.dart';

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
    final mainController = Provider.of<MainController>(context);
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
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 15, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Gelasio",
                    ),
              ),
              GestureDetector(
                onTap: () => homeCartDialog(context, () {
                  final model = CardModel(
                    title: title,
                    image: images,
                    price: price,
                  );
                  mainController.basketSaveData(model);
                  mainController.basketSaveDb();
                  Navigator.pop(context);
                }),
                child: SizedBox(
                  height: size.height * 0.032,
                  width: size.width * 0.068,
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
                        image: AssetImage(AppIcons.shopIcon),
                        height: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
