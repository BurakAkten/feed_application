import 'dart:async';
import 'package:feed_application/domain/dtos/feed_dto.dart';
import 'package:feed_application/screens/feed/feed_service.dart';
import 'package:flutter_project_base/flutter_project_base.dart';

class FeedViewModel extends BaseViewModel {
  final FeedService service;
  FeedViewModel({required this.service});

  int page = 1;
  List<FeedItem> feedItems = [];

  bool isMoreLoading = false;

  @override
  FutureOr<void> init() async {
    feedItems = await service.getFeedItems(page: page);
  }

  Future<void> loadMore() async {
    isMoreLoading = true;
    reloadState();
    feedItems.addAll(await service.getFeedItems(page: ++page));
    isMoreLoading = false;
    reloadState();
  }
}
