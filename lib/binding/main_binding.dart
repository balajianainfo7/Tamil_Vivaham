import 'package:get/get.dart';

import '../preferences/app_preference.dart';

class MainBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AppPreference>(()=> AppPreference(), fenix: true);
  }
}