import 'package:flutter/material.dart';
import 'package:furniture_app/src/controller/main_controller.dart';
import 'package:provider/provider.dart';

Future favoriteDeleteDialog(BuildContext context, int index) {
  final mainController = Provider.of<MainController>(context, listen: false);
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      title: Text(
        "Favoritega o'chirishmi xoxlaysizmi!",
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: "MerriWeather",
            ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            mainController.getCartList.removeAt(index);
            Navigator.pop(context);
          },
          child: Text(
            "Ha",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Yo'q",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
          ),
        )
      ],
    ),
  );
}
