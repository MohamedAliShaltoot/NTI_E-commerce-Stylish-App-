import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_grad_project/core/helper/custom_svg_picture.dart';
import 'package:nti_grad_project/core/helper/responsive.dart';
import 'package:nti_grad_project/core/translation/translation_keys.dart';
import 'package:nti_grad_project/core/utils/app_assets.dart';
import 'package:nti_grad_project/core/utils/app_colors.dart';
import 'package:nti_grad_project/core/widgets/email_form_field.dart';
import 'package:nti_grad_project/core/widgets/my_button.dart';
import 'package:nti_grad_project/features/profile_screen/widgets/custom_language_container.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

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
                    'Settings',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              SizedBox(height: ResponsiveHelper.h(context, height: 27)),
               Row(
                children: [
                  Text(
                    TranslationKeys.language.tr,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),

                

                  Container(
                    decoration: BoxDecoration(
                      // No need for border radius here as we'll handle it in the individual containers
                      border: Border.all(color: Colors.transparent),
                    ),

                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                          //  LanguageCubit.get(context).changeLanguage(true);
                            // TranslationHelper.changeLanguage(true);
                          },
                          child: Stack(
                            children: [
                              CustomLanguageContainer.getCustomLanguageContainer(
                                backgroundColor:
                                    //LanguageCubit.get(context).isArabic
                                        //?
                                         AppColors.primary
                                      //  : const Color(0xffD9D9D9)
                                        ,
                                text: TranslationKeys.arabic.tr,
                                textColor:
                                  //  LanguageCubit.get(context).isArabic
                                      //  ? 
                                        Colors.white
                                       // :
                                       //  AppColors.black
                                       ,
                                borderRadius:
                                  //  LanguageCubit.get(context).isArabic
                                        //?
                                         BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        )
                                       //
                                       // : 
                                        // BorderRadius.only(
                                        //   topLeft: Radius.circular(5),
                                        //   bottomLeft: Radius.circular(5),
                                        // ),
                              ),
                              // if (LanguageCubit.get(context).isArabic)
                              //   Positioned(
                              //     top: 0,
                              //     right: 0,
                              //     child: Container(
                              //       width: 8,
                              //       height: 8,
                              //       decoration: BoxDecoration(
                              //         color: Colors.white,
                              //         shape: BoxShape.circle,
                              //       ),
                              //       margin: EdgeInsets.all(4),
                              //     ),
                              //   ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //  TranslationHelper.changeLanguage(false);
                           // LanguageCubit.get(context).changeLanguage(false);
                          },
                          child: Stack(
                            children: [
                              CustomLanguageContainer.getCustomLanguageContainer(
                                backgroundColor:
                                   // !LanguageCubit.get(context).isArabic
                                       // ?
                                         AppColors.primary
                                        //:
                                       //  const Color(0xffD9D9D9),
                               , text: TranslationKeys.english.tr,
                                textColor:
                                   // !LanguageCubit.get(context).isArabic
                                       // ?
                                         Colors.white
                                      //  : AppColors.black,
                               , borderRadius:
                                   // LanguageCubit.get(context).isArabic
                                      //  ? 
                                        BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                        )
                                        // : BorderRadius.only(
                                        //   topRight: Radius.circular(5),
                                        //   bottomRight: Radius.circular(5),
                                        // ),
                              ),
                              // if (!LanguageCubit.get(context).isArabic)
                              //   Positioned(
                              //     top: 0,
                              //     right: 0,
                              //     child: Container(
                              //       width: 8,
                              //       height: 8,
                              //       decoration: BoxDecoration(
                              //         color: AppColors.red,
                              //         shape: BoxShape.circle,
                              //       ),
                              //       margin: EdgeInsets.all(4),
                              //     ),
                              //   ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
             
              SizedBox(height: ResponsiveHelper.h(context, height: 66)),
             
            ],
          ),
        ),
      ),
    );
  }
}
