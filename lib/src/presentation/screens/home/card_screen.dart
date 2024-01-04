import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/presentation/widget/cartscreen_cart.dart';
import 'package:furniture_app/src/presentation/widget/custom_button.dart';
import 'package:provider/provider.dart';


class CardScreen extends StatelessWidget {
  const CardScreen({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  final String title, price, image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 25,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "My cart",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "MerriWeather",
              ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.712,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: mainController.getBasketList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: CustomCartScreen(
                    title: mainController.getBasketList[index].title,
                    image: mainController.getBasketList[index].image,
                    price: mainController.getBasketList[index].price,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Gelasio",
                      ),
                ),
                Text(
                  "\$ 95.00",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Gelasio",
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.041),
          CustomScreenBottom(
            onPressed: () => {},
            buttonText: "Check out",
            size: const Size(360, 60),
          ),
        ],
      ),
    );
  }
}
