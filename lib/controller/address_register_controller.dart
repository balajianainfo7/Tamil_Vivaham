import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';

import '../resources/app_routes.dart';
import '../utils/api_config.dart';

class AdresssRegisterController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
 
  checkInput(context){
  
      print("objecaaat");
      print(adresssRegisterAPI(context));
      adresssRegisterAPI(context);
      // registerAPI(context);
  
  
}

adresssRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiNmIyYjVmYWY1ZTU5MzQ0ZmViMTFjIiwiaWF0IjoxNjcyOTg4Mzg3LCJleHAiOjE2NzI5OTE5ODd9.8mNgZpSHjKW0I-D6zfSOMv3CijK8RovcFGy51WchOJI"};
  final data = {"religion": controller.dropdownValue2, "caste": controller.dropdownValue3, "sub_caste": controller.dropdownValue4, "community": controller.dropdownValue5, "mother_tounge":controller.dropdownValue6};
  final params ={ "religion_community":data};
  print("Address API Params: ${params}");
  http.post(
      RestApiClient().registerUpdate,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Address Response: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          controller.currentStep = 2;
          print(controller.currentStep = 2);
          // Get.toNamed(RouteNames.welcome);
          print("balaji");
      }else{
        showSnackBar(res["message"].toString(), context);
        print("object1");
      }
    }
  });

}

}