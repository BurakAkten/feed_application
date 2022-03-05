import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  static final double avatarSize = 32.h;
  static final double avatarRowHeight = 60.h;
  static final double feeedItemImageHeight = 400.h;
  static final int descriptionLenght = 150;
  static final double descriptionHeightForThreeLines = 54.h;
  static final double descriptionHeight = 38.h;
}

class AppColors {
  static const Color content = Color(0xff2c2634);
  static const Color grey = Color(0xffC8C8D4);

  static const Color black = Color(0xff000a12);
  static const Color white = Color(0xffffffff);
  static const Color transparent = Colors.transparent;
  static const Color green = Colors.green;
  static const Color red = Colors.red;
  static const Color redAccent = Colors.redAccent;
}

class AppFontUtils {
  static final double headline5 = 24.sp;
  static final double headline6 = 20.sp;
  static final double subtitle = 16.sp;
  static final double subtitle2 = 14.sp;
  static final double body = 16.sp;
  static final double body2 = 14.sp;
  static final double button = 14.sp;
  static final double caption = 12.sp;

  static final double small = 12.sp;
  static final double xSmall = 10.sp;

  static const FontWeight light = FontWeight.w200;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight black = FontWeight.w900;
}

class AppRadius {
  static const double zero = 0;
  static const double small = 4;
  static const double medium = 8;
  static const double large = 16;
}

class AppIconSize {
  static final double small = 20.h;
  static final double medium = 24.h;
  static final double xlarge = 80.h;
}

class AppSpacing {
  static const int spacingZero = 0;
  static const int spacingSmall = 4;
  static const int spacingMedium = 8;
}
