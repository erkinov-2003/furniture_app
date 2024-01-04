import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_icons.dart';

Future profileHelpCenter(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context){
      return Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          )
        ),
        child: SizedBox(
          height: 80,
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => _launchUrl("https://t.me/erkinovv_dev"),
                icon: const Image(
                  image: AssetImage(AppIcons.telegramIcon),
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
              IconButton(
                onPressed: () => _launchUrl("tel: +998777775230"),
                icon: const Image(
                  image: AssetImage(AppIcons.phoneIcon),
                  height: 230,
                ),
              ),
              IconButton(
                onPressed: () => _launchUrl("https://www.instagram.com/erkinovv_dev"),
                icon: const Image(
                  image: AssetImage(AppIcons.instagramIcon),
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> _launchUrl(String uri) async {
  Uri uriLauncher = Uri.parse(uri);
  if (!await launchUrl(uriLauncher)) {
    throw Exception('Could not launch $uriLauncher');
  }
}
