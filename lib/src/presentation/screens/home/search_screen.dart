import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainController = Provider.of<MainController>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Search furniture",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.black,
                fontFamily: "MerriWeather",
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                          controller: controller,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (value) =>
                              mainController.searchCard(value),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search furniture",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "MerriWeather",
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 600,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: mainController.searchCardList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.106,
                              width: size.width * 0.229,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      mainController
                                          .searchCardList[index].image,
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
                                    mainController.searchCardList[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "MerriWeather",
                                        ),
                                  ),
                                  SizedBox(height: size.height * 0.012),
                                  Text(
                                    "\$${mainController.searchCardList[index].price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "MerriWeather",
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
