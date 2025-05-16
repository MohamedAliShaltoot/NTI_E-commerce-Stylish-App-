import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SvgWrapper extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final Widget? placeholder;
  final Color? color;

  const SvgWrapper({
    super.key,
    required this.assetName,
    this.width,
    this.height,
    this.fit,
    this.alignment,
    this.placeholder,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      fit: fit ?? BoxFit.cover,
      alignment: alignment ?? Alignment.center,
      placeholderBuilder:
          (context) => placeholder ?? const CupertinoActivityIndicator(),
    );
  }
}
