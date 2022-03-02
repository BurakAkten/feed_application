class NetworkConfig {
  NetworkConfig._();

  static final NetworkConfig _instance = NetworkConfig._();

  factory NetworkConfig() => _instance;

  String get baseUrl {
    return "http://161.35.162.216:1210/";
  }
}
