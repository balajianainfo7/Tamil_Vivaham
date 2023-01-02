import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:thirumanam/preferences/app_preference.dart';

import 'constants.dart';

class RestApiClient {
  var dio1 = Dio();
  late Dio dioForLogout;
  final AppPreference appPreference = Get.put(AppPreference());
  RestApiClient() {
    dioForLogout =
        Dio(BaseOptions(connectTimeout: 5000, receiveTimeout: 3000, headers: {
          "Cache-Control": "no-cache",
          "Content-Type": "application/json",
          "authorization": 'Bearer ${appPreference.accessToken}'
        }));
  }

  Dio dio = Dio(BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        "Cache-Control": "no-cache",
        "Content-Type": "application/json"
      }));

  // static String login = "${URL}login";
}