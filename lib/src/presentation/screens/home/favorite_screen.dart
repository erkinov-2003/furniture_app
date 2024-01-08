import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/presentation/widget/favorite_card.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.black,
                fontFamily: "MerriWeather",
                fontWeight: FontWeight.w500,
              ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: mainController.favoriteList.isEmpty
          ? Center(
              child: Text(
                "Favorite isEmty....",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            )
          : SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.682,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: mainController.getCartList.length,
                      itemBuilder: (context, index) {
                        return CustomFavoriteCard(
                          index: index,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
