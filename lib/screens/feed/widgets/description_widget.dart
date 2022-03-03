import 'package:feed_application/utils/extensions/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../base/constants/app_constants.dart';
import '../../../base/constants/app_edge_insets.dart';
import '../../../translations/locale_keys.g.dart';

class DescriptionWidget extends StatefulWidget {
  final String description;
  final String userName;

  const DescriptionWidget({Key? key, required this.description, required this.userName}) : super(key: key);

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> with TickerProviderStateMixin {
  late bool _isMore;
  late bool _isBigText;
  late double? _height;
  late String _description;

  @override
  void initState() {
    super.initState();
    _isMore = false;
    _description = widget.description.replaceAll("\n", "  ");
    _isBigText = (_description.length) > AppSizes.descriptionLenght;
    _height = (_description.length) < AppSizes.descriptionLenght ? AppSizes.descriptionHeight / 2 : AppSizes.descriptionHeight;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: _height,
      padding: AppEdgeInsets.only(left: AppSpacing.spacingMedium, right: AppSpacing.spacingMedium),
      alignment: Alignment.topLeft,
      child: Text.rich(
        TextSpan(
          text: "${widget.userName}  ",
          style: context.textTheme.subtitle2,
          children: [
            TextSpan(
              text: _isBigText && !_isMore ? _description.substring(0, 150) : widget.description,
              style: context.textTheme.bodyText2?.copyWith(fontSize: AppFontUtils.small),
            ),
            if (_isBigText)
              TextSpan(
                text: _isMore ? "  ${LocaleKeys.less.locale}..." : "  ${LocaleKeys.more.locale}...",
                style: context.textTheme.caption?.copyWith(fontSize: AppFontUtils.xSmall, color: AppColors.grey),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      _isMore = !_isMore;
                      _height = _isMore ? null : AppSizes.descriptionHeight;
                    });
                  },
              ),
          ],
        ),
      ),
    );
  }
}
