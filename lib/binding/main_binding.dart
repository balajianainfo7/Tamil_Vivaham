import 'package:get/get.dart';
import 'package:thirumanam/controller/dashboard_controller.dart';
import 'package:thirumanam/controller/register_controller.dart';
import 'package:thirumanam/controller/splash_controller.dart';

import '../preferences/app_preference.dart';

class MainBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AppPreference>(()=> AppPreference(), fenix: true);
    Get.lazyPut<SplashController>(()=> SplashController(), fenix: true);
    Get.lazyPut<RegisterController>(()=> RegisterController(), fenix: true);
    Get.lazyPut<DashboardController>(()=> DashboardController(), fenix: true);
  }
}