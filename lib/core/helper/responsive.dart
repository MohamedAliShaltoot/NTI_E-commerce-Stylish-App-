import 'package:flutter/cupertino.dart';

abstract class ResponsiveHelper {
  static double designWidth = 375;
  static double designHeight = 812;

  static double w(context, {required double width}) {
    return MediaQuery.of(context).size.width * (width / designWidth);
  }

  static double h(context, {required double height}) {
    return MediaQuery.of(context).size.height * (height / designHeight);
  }

  static double sp(BuildContext context, {required double fontSize}) {
    // Scale based on width
    return MediaQuery.of(context).size.width * (fontSize / designWidth);
  }
}
