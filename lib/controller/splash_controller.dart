import 'package:get/get.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';

class SplashController extends BaseController{
  @override
  void onInit() {
    checkLogin();
    super.onInit();
  }

  checkLogin(){
    Future.delayed(Duration(seconds: 2)).then((value) {
      if(appPreference.accessToken != null && appPreference.accessToken!.isEmpty){
        Get.toNamed(RouteNames.welcome);
      }else{
        Get.toNamed(RouteNames.dashboard);
      }
    });
  }
}