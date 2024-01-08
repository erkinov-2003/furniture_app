import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import 'custom_counter.dart';

class CustomCartScreen extends StatelessWidget {
  const CustomCartScreen({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
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
                    image: AssetImage(
                      mainController.getBasketList[index].image,
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
                    mainController.getBasketList[index].title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontFamily: "MerriWeather",
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: size.height * 0.010),
                  Text(
                    mainController.getBasketList[index].price,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontFamily: "MerriWeather",
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 20),
                  CustomCounter(
                    value: 0,
                    incrementFunction: () {},
                    decrementFunction: () {},
                  ),
                ],
              ),
            ),
            const Spacer(flex: 4),
            GestureDetector(
              onTap: () {
                mainController.deleteBasketList(
                  mainController.getBasketList[index],
                );
              },
              child: const SizedBox(
                height: 24,
                width: 24,
                child: DecoratedBox(
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
