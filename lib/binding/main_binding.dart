import 'package:get/get.dart';
import 'package:thirumanam/controller/dashboard_controller.dart';

import '../preferences/app_preference.dart';

class MainBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AppPreference>(()=> AppPreference(), fenix: true);
    Get.lazyPut<DashboardController>(()=> DashboardController(), fenix: true);
  }
}