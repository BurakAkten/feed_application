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
  final Color borderColor;

  const AvatarListTileWidget({
    Key? key,
    this.avatarUrl,
    this.title,
    this.subTitle,
    this.icon,
    this.iconOnPressed,
    this.borderColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppEdgeInsets.symmetricMedium(),
      height: AppSizes.avatarRowHeight,
      child: Row(
        children: [
          AvatarWidget(url: avatarUrl ?? "", borderColor: borderColor),
          SizedBox(width: AppSpacing.spacingMedium.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title ?? "-", style: context.textTheme.subtitle2?.copyWith(color: AppColors.white)),
              Text(subTitle ?? "-", style: context.textTheme.bodyText1?.copyWith(color: AppColors.white)),
            ],
          ),
          Spacer(),
          if (icon != null) InkWell(onTap: iconOnPressed, child: icon!)
        ],
      ),
    );
  }
}
