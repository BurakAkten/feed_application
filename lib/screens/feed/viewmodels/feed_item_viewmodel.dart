import 'dart:async';
import 'package:flutter_project_base/flutter_project_base.dart';
import '../../../domain/dtos/feed_dto.dart';

class FeedItemViewModel extends BaseViewModel {
  final FeedItem item;
  FeedItemViewModel(this.item);

  late bool _isSaved;
  late bool _isLiked;

  @override
  FutureOr<void> init() async {
    _isLiked = item.isLiked ?? false;
    _isSaved = item.isBookmarked ?? false;
  }

  void changeLikeStatus() {
    //If there is an update service, can ben used here
    _isLiked = !_isLiked;
    reloadState();
  }

  void changeSavedStatus() {
    //If there is an update service, can ben used here
    _isSaved = !_isSaved;
    reloadState();
  }

  //Getters
  String get placeLocation => "${item.placeLocationNameO ?? "-"} - ${item.placeLocationName ?? "-"}";
  bool get isLiked => _isLiked;
  bool get isSaved => _isSaved;
}
