// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:nti_grad_project/core/helper/custom_svg_picture.dart';
import 'package:nti_grad_project/core/helper/responsive.dart';
import 'package:nti_grad_project/core/utils/app_assets.dart';

class CustomPasswordFormField {
  static Widget getTextPasswordField({
    //   required suffixIconPath,
    // required prefixIconPath,
    required hintText,
    required TextEditingController passwordController,
    required bool isPasswordVisible,
    required void Function() onTap,
    FormFieldValidator<String>? validator,
    required BuildContext context,
  }) {
    return Container(
      height: 56,
      //ResponsiveHelper.h(context, height: 56)
      width: 317,
      //  ResponsiveHelper.w(context, width: 317)
      child: TextFormField(
        obscureText: isPasswordVisible,
        controller: passwordController,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfff3f3f3),
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 16,
              end: 10,
              top: 10,
              bottom: 10,
            ),
            child: IconButton(
              onPressed: onTap,
              icon: CustomSvg(
                path:
                    !isPasswordVisible ? AppAssets.eyeIcon : AppAssets.lockIcon,

                height: 23,
                width: 23,
              ),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 16,
              end: 10,
              top: 10,
              bottom: 10,
            ),
            child: CustomSvg(path: AppAssets.lockIcon, height: 25, width: 25),
          ),

          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 12,
            color: Color(0xff676767),
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffA8A8A9), width: 1),
          ),
        ),
      ),
    );
  }
}
