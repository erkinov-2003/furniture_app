import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/data/model/card_model.dart';
import 'package:furniture_app/src/presentation/screens/home/details_screen.dart';

import '../../widget/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cardModel = CardModel.cardList;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.search, size: 30, color: Colors.black26),
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
        actions: const [
          Padding(
            padding: EdgeInsets.all(14),
            child: Icon(
              Icons.backpack_outlined,
              size: 30,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          child: GridView.builder(
            itemCount: cardModel.length,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 290,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      image: cardModel[index].image,
                      title: cardModel[index].title,
                      price: cardModel[index].price,
                    ),
                  ),
                ),
                child: CustomCard(
                  images: cardModel[index].image,
                  title: cardModel[index].title,
                  price: cardModel[index].price,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
