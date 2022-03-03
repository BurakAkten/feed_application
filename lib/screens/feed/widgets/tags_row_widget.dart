import 'package:feed_application/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../base/constants/app_constants.dart';
import '../../../base/constants/app_edge_insets.dart';
import '../../../domain/dtos/feed_dto.dart';

class TagsRowWidget extends StatelessWidget {
  final List<Tags> tags;

  const TagsRowWidget({Key? key, required this.tags}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppEdgeInsets.only(left: AppSpacing.spacingMedium, right: AppSpacing.spacingMedium, bottom: AppSpacing.spacingMedium),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: tags
              .map(
                (t) => Card(
                  elevation: 4,
                  child: Padding(
                    padding: AppEdgeInsets.symmetricSmall(),
                    child: Text(
                      t.name ?? "",
                      style: context.textTheme.caption?.copyWith(fontWeight: AppFontUtils.bold),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
