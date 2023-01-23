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
      Get.toNamed(RouteNames.login);
      // if(appPreference.accessToken != null && appPreference.accessToken!.isEmpty){
      //   Get.toNamed(RouteNames.welcome);
      // }else{
        print("Token: ${appPreference.accessToken}");
      //   Get.toNamed(RouteNames.dashboard);
      // }
    });
  }
}