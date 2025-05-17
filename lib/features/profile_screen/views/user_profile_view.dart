import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_grad_project/core/helper/custom_svg_picture.dart';
import 'package:nti_grad_project/core/helper/responsive.dart';
import 'package:nti_grad_project/core/translation/translation_keys.dart';
import 'package:nti_grad_project/core/utils/app_assets.dart';
import 'package:nti_grad_project/core/utils/app_colors.dart';
import 'package:nti_grad_project/core/widgets/email_form_field.dart';
import 'package:nti_grad_project/core/widgets/my_button.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.scaffoldBackground,
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },

      //     child: Container(
      //       child: CustomSvg(path: AppAssets.leftIcon, width: 20, height: 20),
      //     ),
      //   ),
      //   title: const Text(
      //     'Profile',
      //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //   ),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
          child: Column(
            children: [
              Row(
                children: [
                  //  SizedBox(width: ResponsiveHelper.w(context, width: 22)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: CustomSvg(
                      path: AppAssets.leftIcon,
                      width: 20,
                      height: 20,
                    ),
                  ),
                  SizedBox(width: ResponsiveHelper.w(context, width: 125.5)),
                  const Text(
                    'Profile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              SizedBox(height: ResponsiveHelper.h(context, height: 27)),
              Stack(
                children: [
                  Positioned(
                    child: Column(
                      children: [
                        Container(
                          width: ResponsiveHelper.w(context, width: 120),
                          height: ResponsiveHelper.h(context, height: 120),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: AppColors.primary,
                            image: DecorationImage(
                              image: AssetImage(AppAssets.profileImage),
                              //AssetImage(AppAssets.dotIcon)
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // CustomSvg(path: AppAssets.dotIcon),
                      ],
                    ),
                  ),
                  // Positioned(
                  //   top: 90,
                  //   left: 90,
                  //   child: CustomSvg(path: AppAssets.dotIcon),
                  // ),
                ],
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 66)),
              CustomFormField.getTextFormField(
                context: context,
                prefixIconPath: AppAssets.userIcon,
                hintText: TranslationKeys.fullNameHintText.tr,
                emailController: TextEditingController(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Full name is required';
                  }

                  return null;
                },
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 10)),
              CustomFormField.getTextFormField(
                context: context,
                prefixIconPath: AppAssets.phoneIcon,
                hintText: TranslationKeys.phoneHintText.tr,
                emailController: TextEditingController(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'phone is required';
                  }

                  return null;
                },
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 75)),
              MyButton(title: TranslationKeys.save.tr, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
