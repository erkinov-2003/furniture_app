import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:furniture_app/src/presentation/screens/dialog/favorite_delete.dart';
import 'package:furniture_app/src/presentation/screens/dialog/home_cart_dialog.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';

class CustomFavoriteCard extends StatelessWidget {
  const CustomFavoriteCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainController = Provider.of<MainController>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.106,
            width: size.width * 0.229,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    mainController.getCartList[index].image,
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
                  mainController.getCartList[index].title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "MerriWeather",
                      ),
                ),
                SizedBox(height: size.height * 0.012),
                Text(
                  mainController.getCartList[index].price,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "MerriWeather",
                      ),
                ),
              ],
            ),
          ),
          const Spacer(flex: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => favoriteDeleteDialog(context, index),
                child: const SizedBox(
                  height: 27,
                  width: 27,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 0.5,
                          ),
                        ]),
                    child: Center(
                      child: Image(
                        image: AssetImage(AppIcons.clearIcon),
                        height: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.023),
              GestureDetector(
                onTap: () => homeCartDialog(
                  context,
                  () => favoriteDeleteDialog(context, index),
                ),
                child: const SizedBox(
                  height: 27,
                  width: 27,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 0.5,
                          ),
                        ]),
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
        ],
      ),
    );
  }
}
