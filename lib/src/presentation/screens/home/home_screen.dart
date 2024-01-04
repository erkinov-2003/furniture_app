import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/data/model/card_model.dart';
import 'package:furniture_app/src/presentation/screens/home/details_screen.dart';
import 'package:furniture_app/src/presentation/widget/home_appbar.dart';
import 'package:provider/provider.dart';

import '../../widget/custom_home.card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardList = CardModel.cardList;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: CustomHomeAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SizedBox(
          child: GridView.builder(
            itemCount: cardList.length,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 310,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      image: cardList[index].image,
                      title: cardList[index].title,
                      price: cardList[index].price,
                    ),
                  ),
                ),
                child: CustomCard(
                  images: cardList[index].image,
                  title: cardList[index].title,
                  price: cardList[index].price,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
