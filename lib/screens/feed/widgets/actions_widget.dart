import 'package:flutter/material.dart';
import '../../../base/constants/app_constants.dart';
import '../../../base/constants/app_edge_insets.dart';
import '../../../resources/app_icons.dart';
import '../viewmodels/feed_item_viewmodel.dart';

class ActionsWidget extends StatelessWidget {
  final FeedItemViewModel vm;

  const ActionsWidget({Key? key, required this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppEdgeInsets.symmetric(vertical: AppSpacing.spacingMedium, horizontal: AppSpacing.spacingXxLarge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(AppIcons.map_border),
          Icon(AppIcons.comment),
          InkWell(
            onTap: vm.changeLikeStatus,
            child: Icon(
              vm.isLiked ? AppIcons.heart : AppIcons.heart_border,
              color: vm.isLiked ? AppColors.red : null,
            ),
          ),
          Icon(AppIcons.paper_plane_border),
        ],
      ),
    );
  }
}
