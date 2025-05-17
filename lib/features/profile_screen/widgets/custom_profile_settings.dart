import 'package:flutter/material.dart';
import 'package:nti_grad_project/core/helper/custom_svg_picture.dart';
import 'package:nti_grad_project/core/utils/app_assets.dart';
import 'package:nti_grad_project/core/utils/app_colors.dart';

ListTile customProfileSettings({
  required String title,

  required String iconPath,
  void Function()? onTap,
  bool isTrailing = true,
}) {
  return ListTile(
    leading: CustomSvg(path: iconPath, color: AppColors.black),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    ),
    trailing:isTrailing? CustomSvg(path: AppAssets.rightIcon) : null,
    onTap: onTap,
  );
}
