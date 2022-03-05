import 'package:carousel_slider/carousel_slider.dart';
import 'package:feed_application/screens/feed/viewmodels/feed_item_viewmodel.dart';
import 'package:feed_application/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../base/constants/app_constants.dart';
import '../../../core_widgets/avatar_list_tile_widget.dart';
import '../../../resources/app_icons.dart';

class FeedItemImageWidget extends StatefulWidget {
  final FeedItemViewModel vm;

  const FeedItemImageWidget({Key? key, required this.vm}) : super(key: key);

  @override
  State<FeedItemImageWidget> createState() => _FeedItemImageWidgetState();
}

class _FeedItemImageWidgetState extends State<FeedItemImageWidget> with SingleTickerProviderStateMixin {
  late Tween<double> _size;
  late Animation<double> _animationSize;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _size = Tween(begin: 0, end: AppIconSize.xlarge);
    _animationSize = _size.animate(_animationController);
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) _animationController.reset();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () async {
        if (!widget.vm.isLiked) await _animationController.forward();
        widget.vm.changeLikeStatus();
      },
      child: Container(
        height: AppSizes.feeedItemImageHeight,
        child: Stack(
          children: [
            _buildSlider(context),
            _buildRow(
              topPadding: 0.0,
              child: AvatarListTileWidget(
                borderColor: AppColors.redAccent,
                avatarUrl: widget.vm.item.authorPhotoUrl,
                title: widget.vm.item.authorUsername,
                subTitle: widget.vm.item.authorFullName,
                icon: Icon(MdiIcons.dotsHorizontal, color: AppColors.white),
              ),
            ),
            _buildRow(
              bottomPadding: 0.0,
              child: AvatarListTileWidget(
                avatarUrl: widget.vm.item.placeLogoUrl,
                title: widget.vm.item.placeName,
                subTitle: widget.vm.placeLocation,
                icon: InkWell(
                  onTap: widget.vm.changeSavedStatus,
                  child: Icon(
                    widget.vm.isSaved ? MdiIcons.star : MdiIcons.starOutline,
                    color: widget.vm.isSaved ? AppColors.green : AppColors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _animationSize,
                builder: (context, child) => Icon(
                  AppIcons.heart,
                  color: AppColors.red,
                  size: _animationSize.value,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(BuildContext context) => CarouselSlider(
        options: CarouselOptions(
          height: AppSizes.feeedItemImageHeight,
          enlargeCenterPage: true,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: false,
        ),
        items: widget.vm.item.photoUrls
                ?.map(
                  (p) => Image.network(
                    p,
                    fit: BoxFit.fill,
                    width: context.width,
                    height: AppSizes.feeedItemImageHeight,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Center(child: CircularProgressIndicator.adaptive());
                    },
                  ),
                )
                .toList() ??
            [],
      );

  Widget _buildRow({required Widget child, double? bottomPadding, double? topPadding}) =>
      Positioned(bottom: bottomPadding, left: 0.0, right: 0.0, top: topPadding, child: child);
}
