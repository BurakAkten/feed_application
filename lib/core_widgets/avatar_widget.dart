import 'package:cached_network_image/cached_network_image.dart';
import 'package:feed_application/base/constants/app_edge_insets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../base/constants/app_constants.dart';

class AvatarWidget extends StatelessWidget {
  final String? url;
  final double radius = AppRadius.xlarge;
  final bool isBordered;

  const AvatarWidget({Key? key, this.url, this.isBordered = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppEdgeInsets.xSmall(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isBordered ? LinearGradient(colors: [Colors.redAccent, Colors.blueAccent]) : null,
        color: isBordered ? null : AppColors.white,
      ),
      child: CircleAvatar(
        radius: radius.w,
        backgroundColor: AppColors.transparent,
        child: CachedNetworkImage(
          imageUrl: url!,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
            height: AppSizes.avatarSize,
            width: AppSizes.avatarSize,
          ),
          errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error,
              size: AppIconSize.large,
              color: AppColors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}
