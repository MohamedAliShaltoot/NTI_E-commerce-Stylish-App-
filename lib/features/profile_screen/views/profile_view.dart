import 'package:flutter/material.dart';
import 'package:nti_grad_project/core/helper/custom_svg_picture.dart';
import 'package:nti_grad_project/core/helper/my_navigator.dart';
import 'package:nti_grad_project/core/helper/responsive.dart';
import 'package:nti_grad_project/core/utils/app_assets.dart';
import 'package:nti_grad_project/core/utils/app_colors.dart';
import 'package:nti_grad_project/features/profile_screen/views/setting_view.dart';
import 'package:nti_grad_project/features/profile_screen/views/user_profile_view.dart';
import 'package:nti_grad_project/features/profile_screen/widgets/custom_profile_settings.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: AppColors.primary,
        child: CustomSvg(
          path: AppAssets.bagBoldIcon,
          color: AppColors.white,
          width: ResponsiveHelper.w(context, width: 32),
          height: ResponsiveHelper.h(context, height: 32),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: ResponsiveHelper.h(context, height: 27)),

              Text(
                'Profile',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: ResponsiveHelper.h(context, height: 12)),
              Container(
                width: ResponsiveHelper.w(context, width: 120),
                height: ResponsiveHelper.h(context, height: 120),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                  image: DecorationImage(
                    image: AssetImage(AppAssets.profileImage),
                    //AssetImage(AppAssets.dotIcon)
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(180),
              //   child: Image.asset(
              //     AppAssets.profileImage,
              //     width: ResponsiveHelper.w(context, width: 92),
              //     height: ResponsiveHelper.h(context, height: 92),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              SizedBox(height: ResponsiveHelper.h(context, height: 19)),
              Text(
                'User full Name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 54)),
              customProfileSettings(
                title: 'My Profile',
                iconPath: AppAssets.profileIcon,
                onTap:
                    () => MyNavigator.goTo(
                      screen: UserProfile(),
                      isReplace: false,
                    ),
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 12)),
              customProfileSettings(
                title: 'My Orders',
                iconPath: AppAssets.bagIcon,
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 12)),
              customProfileSettings(
                title: 'My Favorites',
                iconPath: AppAssets.heartIcon,
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 12)),
              customProfileSettings(
                title: 'Settings',
                iconPath: AppAssets.settingsIcon,
                onTap:
                    () => MyNavigator.goTo(
                      screen: SettingView(),
                      isReplace: false,
                    ),
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 58)),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 34),
                child: Divider(
                  color: AppColors.primary,
                  height: ResponsiveHelper.h(context, height: 1),
                  thickness: 1,
                ),
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 44)),
              customProfileSettings(
                title: 'Log Out',
                iconPath: AppAssets.logOutIcon,
                isTrailing: false,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Log Out'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
