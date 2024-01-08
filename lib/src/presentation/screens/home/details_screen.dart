import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/core/constants/app_icons.dart';
import 'package:furniture_app/src/data/model/card_model.dart';
import 'package:furniture_app/src/presentation/screens/dialog/favorite_dialog.dart';
import 'package:furniture_app/src/presentation/screens/dialog/home_cart_dialog.dart';
import 'package:furniture_app/src/presentation/widget/custom_button.dart';
import 'package:furniture_app/src/presentation/widget/custom_counter.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });
  final String title, price, image;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final mainController = Provider.of<MainController>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: size.height * 0.534,
                width: size.width * 0.854,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                    ),
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.8, -0.9),
              child: SizedBox(
                height: size.height * 0.059,
                width: size.width * 0.127,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.8, -0.5),
              child: SizedBox(
                height: size.height * 0.249,
                width: size.width * 0.178,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3,
                        offset: Offset(-0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(45),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      3,
                      (index) => CircleAvatar(
                        radius: 18,
                        backgroundColor:
                            index == 0 ? const Color(0xFFB4916C) : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.8, 0.2),
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Gelasio",
                    ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.8, 0.4),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.price}",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Gelasio",
                          ),
                    ),
                    CustomCounter(
                      value: mainController.counterPrice,
                      decrementFunction: () => mainController.decrementCounter(),
                      incrementFunction: () => mainController.incrementCounter(),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.9, 0.6 + 0.05),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  "Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Nunito",
                      ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => favoriteAlertDialog(context, () {
                      final cardModel = CardModel(
                        title: widget.title,
                        image: widget.image,
                        price: widget.price,
                      );
                      mainController.favoriteSaveData(cardModel);
                      Navigator.pop(context);
                    }),
                    child: SizedBox(
                      height: size.height * 0.071,
                      width: size.width * 0.153,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.black26,
                            )
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Image(
                            image: AssetImage(AppIcons.favoriteIcon),
                            color: AppColors.black,
                            height: 34,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomScreenBottom(
                    onPressed: () => homeCartDialog(context, () {
                      final model = CardModel(
                        title: widget.title,
                        image: widget.image,
                        price: widget.price,
                      );
                      mainController.getAllSaveBasketList(
                        model,
                        mainController.counterPrice,
                      );
                      Navigator.pop(context);
                    }),
                    buttonText: "Add to Cart",
                    size: Size(size.width * 0.663, size.height * 0.071),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
