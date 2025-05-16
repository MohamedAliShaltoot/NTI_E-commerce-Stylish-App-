import 'package:flutter/material.dart';
import 'package:nti_grad_project/core/widgets/svg_wrapper.dart';

import '../../../../core/helper/responsive.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';


class MyPageview extends StatelessWidget {
  const MyPageview({
    super.key,
    required this.pages,
    required this.pageController,
    this.onPageChanged,
  });
  final List<Map<String, dynamic>> pages;
  final PageController pageController;
  final void Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: pages.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.w(context, width: 18),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgWrapper(
                assetName: pages[index]['image'],
                fit: BoxFit.cover,
                height: ResponsiveHelper.h(context, height: 300),
                width: ResponsiveHelper.w(context, width: 300),
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 15)),
              Text(
                pages[index]['title'],
                style: AppTextStyles.f24w800(context, color: AppColors.black),
              ),
              SizedBox(height: ResponsiveHelper.h(context, height: 10)),
              Text(
                pages[index]['body'],
                textAlign: TextAlign.center,
                style: AppTextStyles.f14w600(context, color: AppColors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}
