import 'network_config.dart';

class NetworkUrls {
  final _baseUrl = NetworkConfig().baseUrl;

  //URL
  final String _feed = "interview/home/reel";

  //ENDPoint
  String get feedUrl => _baseUrl + _feed;
}
