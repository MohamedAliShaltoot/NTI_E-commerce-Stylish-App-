// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:nti_grad_project/core/helper/custom_svg_picture.dart';
//import 'package:nti_grad_project/core/helper/responsive.dart';
import 'package:nti_grad_project/core/utils/app_assets.dart';

class CustomFormField {
  static Widget getTextFormField({
    //   required suffixIconPath,
    required prefixIconPath,
    required hintText,
    required TextEditingController emailController,
    //required bool isPasswordVisible,
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
        validator: validator,

        controller: emailController,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfff3f3f3),

          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 16,
              end: 10,
              top: 10,
              bottom: 10,
            ),
            child: CustomSvg(path: prefixIconPath, height: 25, width: 25),
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
