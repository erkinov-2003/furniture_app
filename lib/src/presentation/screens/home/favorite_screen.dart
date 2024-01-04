import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/presentation/widget/custom_button.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              SizedBox(
                height: 575,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
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
                                )
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left:10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Coffee Table"),
                                SizedBox(height: 10),
                                Text("\$ 50.00"),
                              ],
                            ),
                          ),
                          const Spacer(flex: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: (){}, icon: const Icon(Icons.clear)),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.save_alt)),
                            ],
                          ),
                        ],
                      )
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              CustomScreenBottom(
                size: const Size(360, 60),
                onPressed: () => {},
                buttonText: "Add all to my cart",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
