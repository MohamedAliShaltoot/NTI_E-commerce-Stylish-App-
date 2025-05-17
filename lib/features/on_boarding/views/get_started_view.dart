import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_grad_project/core/helper/my_navigator.dart';
import 'package:nti_grad_project/core/translation/translation_keys.dart';
import 'package:nti_grad_project/core/utils/app_assets.dart';
import 'package:nti_grad_project/core/widgets/my_button.dart';
import 'package:nti_grad_project/features/auth/views/login_view.dart';
import 'package:nti_grad_project/features/auth/views/register_view.dart';
import 'package:nti_grad_project/features/on_boarding/widgets/my_outlined_button.dart';


import '../../../core/helper/responsive.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.getStartedBackground),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.w(context, width: 45),
              vertical: ResponsiveHelper.h(context, height: 35),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.black.withAlpha(5), AppColors.black],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  TranslationKeys.youWantAuthenticHereYouGo.tr,
                  style: AppTextStyles.f34w600(
                    context,
                    color: AppColors.white,
                  ).copyWith(height: 1.1),

                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ResponsiveHelper.h(context, height: 24)),
                Text(
                  TranslationKeys.findItHereHuyItNow.tr,
                  style: AppTextStyles.f14w400(
                    context,
                    color: AppColors.lightWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ResponsiveHelper.h(context, height: 24)),
                MyButton(title: TranslationKeys.login.tr, onPressed: () {
                  MyNavigator.goTo(screen: LoginView(),
                    isReplace:false,
                  );
                }),
                SizedBox(height: ResponsiveHelper.h(context, height: 15)),
                MyOutlinedButton(
                  title: TranslationKeys.register.tr,
                  onPressed: () {
                    MyNavigator.goTo(screen: RegisterView(),
                      isReplace:false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
