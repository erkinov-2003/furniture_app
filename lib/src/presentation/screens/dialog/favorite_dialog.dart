import 'package:flutter/material.dart';

Future favoriteAlertDialog(
    BuildContext context, void Function()? onPressed) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )
        ),
        title: Text(
          "Favoritega qoshishni xoxlaysizmi!",
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "MerriWeather",
              ),
        ),
        actions: [
          TextButton(
            onPressed: onPressed,
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
      );
    },
  );
}
