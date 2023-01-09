import 'package:get/get.dart';
import 'package:thirumanam/controller/address_register_controller.dart';
import 'package:thirumanam/controller/carrier_deatils_controller.dart';
import 'package:thirumanam/controller/communication_register.dart';
import 'package:thirumanam/controller/dashboard_controller.dart';
import 'package:thirumanam/controller/forgot_otp_controller.dart';
import 'package:thirumanam/controller/jathagam_details_controller.dart';
import 'package:thirumanam/controller/personal_details_controller.dart';
import 'package:thirumanam/controller/register_controller.dart';
import 'package:thirumanam/controller/splash_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/controller/update_controllers/address_update.dart';
import 'package:thirumanam/controller/update_controllers/basic_update.dart';
import 'package:thirumanam/controller/update_controllers/carrier_update.dart';
import 'package:thirumanam/controller/update_controllers/communication_update.dart';
import 'package:thirumanam/controller/update_controllers/family_update.dart';
import 'package:thirumanam/controller/update_controllers/jathagam_update.dart';
import 'package:thirumanam/controller/update_controllers/personal_update.dart';
import 'package:thirumanam/controller/verify_otp_controller.dart';

import '../controller/family_details_controller.dart';
import '../preferences/app_preference.dart';

class MainBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AppPreference>(()=> AppPreference(), fenix: true);
    Get.lazyPut<SplashController>(()=> SplashController(), fenix: true);
    Get.lazyPut<RegisterController>(()=> RegisterController(), fenix: true);
    Get.lazyPut<DashboardController>(()=> DashboardController(), fenix: true);
    Get.lazyPut<ForgotOtpController>(()=> ForgotOtpController(), fenix: true);
    Get.lazyPut<verifyOtpController>(()=> verifyOtpController(), fenix: true);
    Get.lazyPut<StepperRegisterController>(()=> StepperRegisterController(), fenix: true);
    Get.lazyPut<AdresssRegisterController>(()=> AdresssRegisterController(), fenix: true);
    Get.lazyPut<CommunicationRegisterController>(()=> CommunicationRegisterController(), fenix: true);
    Get.lazyPut<PersonalRegisterController>(()=> PersonalRegisterController(), fenix: true);
    Get.lazyPut<CarrierRegisterController>(()=> CarrierRegisterController(), fenix: true);
    Get.lazyPut<JathgamRegisterController>(()=> JathgamRegisterController(), fenix: true);
    Get.lazyPut<FamilyRegisterController>(()=> FamilyRegisterController(), fenix: true);
    Get.lazyPut<BasicUpdateController>(()=> BasicUpdateController(), fenix: true);
    Get.lazyPut<AddressUpdateController>(()=> AddressUpdateController(), fenix: true);
    Get.lazyPut<CommunicationUpdateController>(()=> CommunicationUpdateController(), fenix: true);
    Get.lazyPut<PersonalUpdateController>(()=> PersonalUpdateController(), fenix: true);
    Get.lazyPut<CarrierUpdateController>(()=> CarrierUpdateController(), fenix: true);
    Get.lazyPut<JathagamUpdateController>(()=> JathagamUpdateController(), fenix: true);
    Get.lazyPut<FamilyUpdateController>(()=> FamilyUpdateController(), fenix: true);
  }
}