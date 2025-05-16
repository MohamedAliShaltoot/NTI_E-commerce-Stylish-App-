import 'package:flutter/material.dart';

import 'app_colors.dart';
import '../helper/responsive.dart';

abstract class AppTextStyles {
  static const String fontFamily = 'Montserrat';

  static TextStyle f24w800(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 24),
      fontWeight: FontWeight.w800,
      color: color,
    );
  }

  static TextStyle f14w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 14),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle f14w400(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle f16w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 16),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle f18w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 18),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle f20w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 20),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle f23w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 23),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle f34w600(
    BuildContext context, {
    Color color = AppColors.black,
  }) {
    return TextStyle(
      fontSize: ResponsiveHelper.sp(context, fontSize: 34),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }
}
