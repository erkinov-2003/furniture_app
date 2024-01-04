import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/core/constants/app_icons.dart';
import 'package:furniture_app/src/service/auth_service.dart';

import '../../widget/custom_profile_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final firebaseAuth = FirebaseAuth.instance.currentUser;

  void logOutFirebase() async {
    final authService = FurnitureAuthService();
    authService.logOutButton();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "Gelasio",
              ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: logOutFirebase,
              icon: const Image(
                image: AssetImage(AppIcons.logOutIcon),
                height: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  "${firebaseAuth!.displayName}",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                        fontFamily: "Gelasio",
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "${firebaseAuth!.displayName}",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.grey,
                        fontFamily: "Gelasio",
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              CustomProfileCart(
                images: AppIcons.mailIcon,
                title: "${firebaseAuth!.email}",
              ),
              const SizedBox(height: 30),
              CustomProfileCart(
                title: "Info",
                images: AppIcons.infoIcon,
              ),
              const SizedBox(height: 30),
              CustomProfileCart(
                images: AppIcons.helpCenterIcon,
                title: "Help center",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
