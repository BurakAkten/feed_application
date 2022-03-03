import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../base/constants/app_constants.dart';

class AvatarWidget extends StatelessWidget {
  final String? url;
  final double radius = AppRadius.large;
  final Color borderColor;

  const AvatarWidget({Key? key, this.url, this.borderColor = AppColors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: (radius).h,
      backgroundColor: AppColors.content,
      child: CachedNetworkImage(
        imageUrl: url!,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            border: Border.all(width: 4, color: borderColor),
          ),
          height: AppSizes.avatarSize,
          width: AppSizes.avatarSize,
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 4, color: borderColor),
          ),
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
