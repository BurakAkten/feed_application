import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_constants.dart';

class AppEdgeInsets extends EdgeInsets {
  AppEdgeInsets.all(int value) : super.all(value.w);
  AppEdgeInsets.only({int left = 0, int top = 0, int right = 0, int bottom = 0})
      : super.only(left: left.w, top: top.h, right: right.w, bottom: bottom.h);

  AppEdgeInsets.zero() : super.all(0);

  AppEdgeInsets.medium() : super.all(AppSpacing.spacingMedium.w);

  AppEdgeInsets.small() : super.all(AppSpacing.spacingSmall.w);

  AppEdgeInsets.symmetricMedium() : super.symmetric(vertical: AppSpacing.spacingMedium.h, horizontal: AppSpacing.spacingMedium.w);
  AppEdgeInsets.symmetricSmall() : super.symmetric(vertical: AppSpacing.spacingSmall.h, horizontal: AppSpacing.spacingSmall.w);

  AppEdgeInsets.symmetric({int horizontal = 0, int vertical = 0}) : super.symmetric(vertical: vertical.h, horizontal: horizontal.w);
}
