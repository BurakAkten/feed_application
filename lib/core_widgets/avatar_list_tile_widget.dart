import 'package:feed_application/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../base/constants/app_constants.dart';
import '../base/constants/app_edge_insets.dart';
import 'avatar_widget.dart';

class AvatarListTileWidget extends StatelessWidget {
  final String? avatarUrl;
  final String? title;
  final String? subTitle;
  final Widget? icon;
  final Function()? iconOnPressed;
  final bool isBordered;

  const AvatarListTileWidget({
    Key? key,
    this.avatarUrl,
    this.title,
    this.subTitle,
    this.icon,
    this.iconOnPressed,
    this.isBordered = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppEdgeInsets.only(left: AppSpacing.spacingSmall, right: AppSpacing.spacingLarge),
      height: AppSizes.avatarRowHeight,
      child: Row(
        children: [
          AvatarWidget(url: avatarUrl ?? "", isBordered: isBordered),
          SizedBox(width: AppSpacing.spacingSmall.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title ?? "-", style: context.textTheme.subtitle2?.copyWith(color: AppColors.white)),
                SizedBox(height: AppSpacing.spacingXxxSmall.h),
                Text(subTitle ?? "-", style: context.textTheme.bodyText1?.copyWith(color: AppColors.white)),
              ],
            ),
          ),
          SizedBox(width: AppSpacing.spacingSmall.w),
          if (icon != null) InkWell(onTap: iconOnPressed, child: icon!)
        ],
      ),
    );
  }
}
