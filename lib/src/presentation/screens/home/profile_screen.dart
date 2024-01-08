import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/src/core/constants/app_colors.dart';
import 'package:furniture_app/src/core/constants/app_icons.dart';
import 'package:furniture_app/src/presentation/screens/dialog/profile_help_center.dart';
import 'package:furniture_app/src/presentation/screens/dialog/profile_info.dart';
import 'package:furniture_app/src/presentation/screens/dialog/profile_log_out.dart';
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
    final size = MediaQuery.of(context).size;
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
              onPressed: () => profileLogOut(context),
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
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AppIcons.personIcon),
                  backgroundColor: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(height: size.height * 0.023),
              Center(
                child: Text(
                  "${firebaseAuth!.email}",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.grey,
                        fontFamily: "Gelasio",
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              SizedBox(height: size.height * 0.047),
              CustomProfileCart(
                images: AppIcons.mailIcon,
                title: "${firebaseAuth!.email}",
              ),
              SizedBox(height: size.height * 0.035),
              CustomProfileCart(
                title: "Info",
                images: AppIcons.infoIcon,
                onPressed: () => profileInfoDialog(context),
              ),
              SizedBox(height: size.height * 0.035),
              CustomProfileCart(
                onPressed: () => profileHelpCenter(context),
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
