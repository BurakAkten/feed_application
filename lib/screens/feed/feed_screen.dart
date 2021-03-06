import 'package:feed_application/base/constants/app_constants.dart';
import 'package:feed_application/screens/feed/feed_service.dart';
import 'package:feed_application/screens/feed/viewmodels/feed_viewmodel.dart';
import 'package:feed_application/screens/feed/views/feed_item_view.dart';
import 'package:feed_application/translations/locale_keys.g.dart';
import 'package:feed_application/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_base/flutter_project_base.dart';

import '../../core_widgets/no_item_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late final ScrollController controller;
  late final FeedViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = FeedViewModel(service: FeedService());
    controller = ScrollController();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) viewModel.loadMore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(context),
      body: BaseView<FeedViewModel>(
        vmBuilder: (_) => viewModel,
        builder: _buildScreen,
      ),
    );
  }

  Widget _buildScreen(BuildContext context, FeedViewModel viewModel) => viewModel.feedItems.isEmpty
      ? NoItemWidget(title: viewModel.message ?? LocaleKeys.sthWentWrong.locale)
      : ListView.builder(
          controller: controller,
          itemCount: viewModel.feedItems.length,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeedItemView(item: viewModel.feedItems[index]),
              if (index == viewModel.feedItems.length - 1 && viewModel.isMoreLoading) Center(child: CircularProgressIndicator.adaptive())
            ],
          ),
        );

  AppBar _buildAppBar(BuildContext context) => AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.feed.locale, style: context.textTheme.headline5?.copyWith(color: AppColors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      );
}
