import 'package:flutter/material.dart';
import 'package:furniture_app/src/service/auth_service.dart';

Future profileLogOut(BuildContext context) {
  final service = FurnitureAuthService();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          )
        ),
        title: Text(
          "Chiqishni xoxlaysizmi!",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "MerriWeather",
              ),
        ),
        actions: [
          TextButton(
            onPressed: () => service.logOutButton(),
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
          ),
        ],
      );
    },
  );
}
