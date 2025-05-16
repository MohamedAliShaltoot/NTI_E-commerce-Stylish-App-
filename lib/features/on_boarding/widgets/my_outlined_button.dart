import 'package:flutter/material.dart';
import 'package:nti_grad_project/core/helper/responsive.dart';
import 'package:nti_grad_project/core/utils/app_text_styles.dart';


import '../../../../core/utils/app_colors.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ResponsiveHelper.h(context, height: 55),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.white,
          side: BorderSide(color: AppColors.primary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ResponsiveHelper.w(context, width: 5),
            ),
          ),
        ),
        child: Text(
          title,
          style: AppTextStyles.f23w600(context, color: AppColors.primary),
        ),
      ),
    );
  }
}
