import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/presentation/widget/custom_button.dart';
import 'package:furniture_app/src/presentation/widget/custom_counter.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            height: 600,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 90,
                            width: 90,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Coffee Table"),
                                SizedBox(height: 10),
                                Text("\$ 50.00"),
                                SizedBox(height: 20),
                                CustomCounter(),
                              ],
                            ),
                          ),
                          const Spacer(flex: 5),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.clear),
                          )
                        ],
                      ),
                    ],
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
          const SizedBox(height: 35),
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
