import 'package:feed_application/base/constants/app_constants.dart';
import 'package:feed_application/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NoItemWidget extends StatelessWidget {
  final String title;

  const NoItemWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(MdiIcons.alertCircle, color: AppColors.red),
          Text(title, style: context.textTheme.subtitle1),
        ],
      ),
    );
  }
}
