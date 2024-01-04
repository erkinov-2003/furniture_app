import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../screens/home/card_screen.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    return PreferredSize(
      preferredSize: const Size(double.infinity, 100),
      child: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.search,
            size: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Make home",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Gelasio",
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              "BEAUTIFUL",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Gelasio",
                  ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () => mainController.navigatorPage(
                context,
                const CardScreen(image: "", title: "", price: ""),
              ),
              child: mainController.getBasketList.isEmpty
                  ? const Image(
                      image: AssetImage(
                        AppIcons.shopIcon,
                      ),
                    )
                  : Badge(
                      label: Text("${mainController.basketList.length}"),
                      child: const Image(
                        image: AssetImage(AppIcons.shopIcon),
                        height: 20,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
