import 'package:flutter/material.dart';

Future profileInfoDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            )
          ),
          child: SizedBox(
            height: 160,
            width: 250,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Furniture app backend tayyor bolishi ushbu appni ishga tushuramiz. Sizga yoqdi degan umitdama",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
          ),
        );
      });
}
