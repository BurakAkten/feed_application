import 'package:feed_application/base/network_manager.dart';
import 'package:feed_application/domain/dtos/feed_dto.dart';
import 'package:feed_application/utils/network_urls.dart';

class FeedService {
  Future<List<FeedItem>> getFeedItems({double lat = 51.5, double lon = -0.17, int page = 1}) async {
    var parameter = FeedHeaderParameter(lat: lat, lon: lon, page: page);
    var url = NetworkUrls().feedUrl + parameter.toString();
    var response = await NetworkManager().makeRequest(url);
    if (response.isSuccess && response.data != null && response.data!.isNotEmpty) return FeedItem.listFromJson(response.data);
    return [];
  }
}
