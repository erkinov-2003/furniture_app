import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/core/constants/app_icons.dart';
import 'package:furniture_app/src/presentation/widget/custom_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });
  final String image;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 450,
                width: 335,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                    ),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-0.8, -0.9),
              child: SizedBox(
                height: 50,
                width: 50,
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
                height: 210,
                width: 70,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3,
                          offset: Offset(-0, 0)),
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
                title,
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
                      price,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Gelasio",
                          ),
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                        Text("01"),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: Icon(Icons.remove),
                            ),
                          ),
                        ),
                      ],
                    )
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
                  const SizedBox(
                    height: 60,
                    width: 60,
                    child: DecoratedBox(
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
                          image: AssetImage(AppIcons.shopIcon),
                          color: AppColors.black,
                          height: 34,
                        ),
                      )
                    ),
                  ),
                  CustomScreenBottom(
                    onPressed: () {},
                    buttonText: "Add to Cart",
                    size: const Size(260, 60),
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
