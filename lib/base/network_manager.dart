import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:feed_application/utils/extensions/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:synchronized/synchronized.dart' as sync;
import '../../translations/locale_keys.g.dart';

final _checkConnectivityLock = sync.Lock();
DateTime _checkConnectivityTime = DateTime.now();
late ConnectivityResult _connectivityStatus;

Future<ConnectivityResult> checkInternet() async {
  try {
    if (DateTime.now().difference(_checkConnectivityTime).inSeconds <= 120) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      return _connectivityStatus = connectivityResult;
    } else {
      await _checkConnectivityLock.synchronized(() async {
        if (_connectivityStatus == ConnectivityResult.none || DateTime.now().difference(_checkConnectivityTime).inSeconds > 120) {
          final result = await InternetAddress.lookup('google.com').timeout(const Duration(seconds: 3));
          _connectivityStatus = (result.isNotEmpty && result[0].rawAddress.isNotEmpty) ? _connectivityStatus : ConnectivityResult.none;
          _checkConnectivityTime = DateTime.now();
        }
      });
    }
    return _connectivityStatus;
  } on SocketException catch (_) {
    debugPrint('not connected');
    return ConnectivityResult.none;
  } catch (e) {
    debugPrint('not connected : $e');
    return ConnectivityResult.none;
  }
}

class NetworkManager {
  static final NetworkManager _instance = NetworkManager.internal();

  NetworkManager.internal();

  factory NetworkManager() => _instance;

  final JsonDecoder _decoder = const JsonDecoder();

  Future<NetworkResponse> makeRequest(String url, {body, int timeOutInSec = 15, RequestType type = RequestType.get}) async {
    if (await checkInternet() == ConnectivityResult.none)
      return NetworkResponse(errorMessage: LocaleKeys.controlInternetConnectionAndTryAgain.locale, isConnectionProblem: true);

    var _httpHeader = {"accept": "application/json", "Content-Type": "application/json"};

    try {
      switch (type) {
        case RequestType.get:
          return http
              .get(Uri.parse(url), headers: _httpHeader)
              .timeout(Duration(seconds: timeOutInSec))
              .catchError((_) => http.Response('{"Status": "UnKnown"}', 500))
              .then((response) => parseResponse(response, url, body, type));
      }
    } catch (e) {
      return NetworkResponse(isConnectionProblem: true, errorMessage: LocaleKeys.sthWentWrong.locale);
    }
  }

  FutureOr<NetworkResponse> parseResponse(http.Response response, String url, body, requestType) async {
    try {
      String apiResponse = response.body;
      int statusCode = response.statusCode;
      var result = _decoder.convert(apiResponse);
      if (statusCode == 200) {
        return NetworkResponse(isSuccess: true, data: result);
      } else {
        return NetworkResponse(isSuccess: false, errorMessage: LocaleKeys.sthWentWrong.locale);
      }
    } catch (e) {
      return NetworkResponse(isConnectionProblem: true, errorMessage: LocaleKeys.sthWentWrong.locale);
    }
  }
}

enum RequestType { get }

class NetworkResponse {
  final bool isSuccess;
  final String? errorMessage;
  final String? statusCode;
  final String? message;
  final bool isConnectionProblem;
  final List<dynamic>? data;

  NetworkResponse({
    this.isSuccess = false,
    this.errorMessage,
    this.message,
    this.isConnectionProblem = false,
    this.data,
    this.statusCode,
  });
}
