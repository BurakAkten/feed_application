import 'dart:async';
import 'package:feed_application/domain/dtos/feed_dto.dart';
import 'package:feed_application/screens/feed/feed_service.dart';
import 'package:feed_application/translations/locale_keys.g.dart';
import 'package:feed_application/utils/extensions/extensions.dart';
import 'package:flutter_project_base/flutter_project_base.dart';

class FeedViewModel extends BaseViewModel {
  final FeedService service;
  FeedViewModel({required this.service});

  int page = 1;
  List<FeedItem> feedItems = [];

  bool isMoreLoading = false;
  String? message;

  @override
  FutureOr<void> init() async {
    var response = await service.getFeedItems(page: page);
    if (response.isSuccess && response.data != null && response.data!.isNotEmpty)
      feedItems = FeedItem.listFromJson(response.data);
    else
      message = response.errorMessage ?? LocaleKeys.sthWentWrong.locale;
  }

  Future<void> loadMore() async {
    isMoreLoading = true;
    reloadState();
    var response = await service.getFeedItems(page: ++page);
    if (response.isSuccess && response.data != null && response.data!.isNotEmpty) feedItems.addAll(FeedItem.listFromJson(response.data));
    isMoreLoading = false;
    reloadState();
  }
}
