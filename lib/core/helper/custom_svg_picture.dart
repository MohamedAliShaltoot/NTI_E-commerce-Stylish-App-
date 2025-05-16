import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvg extends StatelessWidget {
   const CustomSvg({super.key, required this.path, this.height, this.width, this.onTap,});

  final String path;
  final double? height;
  final double? width;
 final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: SvgPicture.asset(path, height: height, width: width));
  }
}
