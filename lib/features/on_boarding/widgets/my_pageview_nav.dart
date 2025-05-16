import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nti_grad_project/core/helper/nav_helper.dart';


import '../../../../core/helper/responsive.dart';
import '../../../../core/translation/translation_keys.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class MyPageviewNav extends StatelessWidget {
  const MyPageviewNav({
    super.key,
    required this.pages,
    required this.pageController,
    required this.currentPage,
    required this.destination,
  });
  final List<Map<String, dynamic>> pages;
  final PageController pageController;
  final int currentPage;
  final Duration _animationDuration = const Duration(milliseconds: 200);
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            onTap: () {
              if (currentPage > 0) {
                pageController.previousPage(
                  duration: _animationDuration,
                  curve: Curves.easeIn,
                );
              }
            },
            child:
                currentPage == 0
                    ? Text('')
                    : Text(
                      TranslationKeys.prev.tr,
                      style: AppTextStyles.f18w600(
                        context,
                        color: AppColors.lightGrey,
                      ),
                    ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pages.length,
            (index) => AnimatedContainer(
              duration: _animationDuration,
              margin: EdgeInsets.only(
                right: ResponsiveHelper.w(context, width: 10),
              ),
              height: ResponsiveHelper.h(context, height: 8),
              width:
                  currentPage == index
                      ? ResponsiveHelper.w(context, width: 40)
                      : ResponsiveHelper.w(context, width: 8),
              decoration: BoxDecoration(
                color:
                    currentPage == index
                        ? AppColors.sliderColor
                        : AppColors.grey,
                borderRadius: BorderRadius.circular(
                  ResponsiveHelper.w(context, width: 10),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            onTap: () {
              if (currentPage < pages.length - 1) {
                pageController.nextPage(
                  duration: _animationDuration,
                  curve: Curves.easeIn,
                );
              } else {
                NavHelper.pushReplace(() => destination);
              }
            },
            child: Text(
              currentPage == pages.length - 1
                  ? TranslationKeys.getStarted.tr
                  : TranslationKeys.next.tr,
              style: AppTextStyles.f18w600(context, color: AppColors.primary),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}
