import 'package:feed_application/domain/dtos/feed_dto.dart';
import 'package:feed_application/screens/feed/widgets/feed_item_image_widget.dart';
import 'package:feed_application/utils/extensions/context_extension.dart';
import 'package:feed_application/utils/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base/constants/app_constants.dart';
import '../../../base/constants/app_edge_insets.dart';
import '../viewmodels/feed_item_viewmodel.dart';
import '../widgets/actions_widget.dart';
import '../widgets/description_widget.dart';
import '../widgets/tags_row_widget.dart';

class FeedItemView extends StatefulWidget {
  final FeedItem item;

  const FeedItemView({Key? key, required this.item}) : super(key: key);

  @override
  State<FeedItemView> createState() => _FeedItemViewState();
}

class _FeedItemViewState extends State<FeedItemView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FeedItemViewModel>.value(
      value: FeedItemViewModel(widget.item),
      child: Consumer<FeedItemViewModel>(
        builder: (context, vm, child) => Container(
          key: Key(widget.item.id.toString()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeedItemImageWidget(vm: vm),
              ActionsWidget(vm: vm),
              DescriptionWidget(userName: vm.item.authorUsername ?? "", description: vm.item.description ?? ""),
              if (vm.item.tags != null && vm.item.tags!.isNotEmpty) TagsRowWidget(tags: vm.item.tags!),
              Container(
                padding: AppEdgeInsets.symmetricMedium(),
                child: Text(
                  vm.item.createdAt.timeDifference,
                  style: context.textTheme.caption?.copyWith(color: AppColors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
