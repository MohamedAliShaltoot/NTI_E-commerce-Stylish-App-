import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_grad_project/core/helper/nav_helper.dart';
import 'package:nti_grad_project/core/helper/responsive.dart';
import 'package:nti_grad_project/core/utils/app_colors.dart';
import 'package:nti_grad_project/core/utils/app_text_styles.dart';
import 'package:nti_grad_project/features/on_boarding/views/get_started_view.dart';
import 'package:nti_grad_project/features/on_boarding/widgets/my_pageview.dart';
import 'package:nti_grad_project/features/on_boarding/widgets/my_pageview_nav.dart';


import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_assets.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  List<Map<String, dynamic>> pages = [
    {
      'id': 1,
      'image': AppAssets.onboarding_1,
      'title': TranslationKeys.chooseProducts.tr,
      'body': TranslationKeys.body.tr,
    },
    {
      'id': 2,
      'image': AppAssets.onboarding_2,
      'title': TranslationKeys.makePayment.tr,
      'body': TranslationKeys.body.tr,
    },
    {
      'id': 3,
      'image': AppAssets.onboarding_3,
      'title': TranslationKeys.getYourOrder.tr,
      'body': TranslationKeys.body.tr,
    },
  ];

  final PageController pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,

          actions:
              _currentPage == pages.length - 1
                  ? []
                  : [
                    TextButton(
                      onPressed: () {
                        NavHelper.pushReplace(() => const GetStartedView());
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: Text(
                        TranslationKeys.skip.tr,
                        style: AppTextStyles.f18w600(
                          context,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
          actionsPadding: EdgeInsetsDirectional.only(
            end: ResponsiveHelper.w(context, width: 18),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: MyPageview(
                pages: pages,
                pageController: pageController,
                onPageChanged: (currentPage) {
                  setState(() {
                    _currentPage = currentPage;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 22),
              child: MyPageviewNav(
                pages: pages,
                pageController: pageController,
                currentPage: _currentPage,
                destination: GetStartedView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
