import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:furniture_app/src/core/constants/app_icons.dart';
import 'package:furniture_app/src/presentation/screens/home/favorite_screen.dart';
import 'package:furniture_app/src/presentation/screens/home/home_screen.dart';
import 'package:furniture_app/src/presentation/screens/home/profile_screen.dart';
import 'package:furniture_app/src/presentation/screens/home/search_screen.dart';
import 'package:provider/provider.dart';

class PageBuilder extends StatefulWidget {
  const PageBuilder({super.key});

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  late PageController controller;
  int index = 0;

  @override
  void initState() {
    controller = PageController();
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
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
                setState(() {
                  index = 0;
                });
              },
              icon: Image(
                image: const AssetImage(AppIcons.homeIcon),
                height: 28,
                color: index == 0 ? Colors.red : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
                setState(() {
                  index = 1;
                });
              },
              icon: mainController.getCartList.isEmpty
                  ? Image(
                      image: const AssetImage(AppIcons.favoriteIcon),
                      height: 28,
                      color: index == 1 ? Colors.red : Colors.black,
                    )
                  : Badge(
                      label: Text("${mainController.getCartList.length}"),
                      backgroundColor: Colors.red,
                      child: Image(
                        image: const AssetImage(AppIcons.favoriteIcon),
                        height: 28,
                        color: index == 1 ? Colors.red : Colors.black,
                      ),
                    ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  controller.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                  setState(() {
                    index = 2;
                  });
                });
              },
              icon: Image(
                image: const AssetImage(AppIcons.searchIcon),
                height: 28,
                color: index == 2 ? Colors.red : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  controller.animateToPage(
                    3,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                });
                setState(() {
                  index = 3;
                });
              },
              icon: Image(
                image: const AssetImage(AppIcons.userIcon),
                height: 28,
                color: index == 3 ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          FavoriteScreen(),
          SearchScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
