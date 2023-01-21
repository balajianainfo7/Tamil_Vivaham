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

class CarrierRegisterController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController WorkingInController = TextEditingController(text: '');
  TextEditingController CompanydetailsController = TextEditingController(text: '');
  TextEditingController AnnualIcome = TextEditingController(text: '');
  
  checkInput(context){
  if(WorkingInController.text.isEmpty){
    showSnackBar("Enter Working in details", context);
  }else if(CompanydetailsController.text.isEmpty){
    showSnackBar("Enter Company Details", context);
  }else if(AnnualIcome.text.isEmpty){
    showSnackBar("Enter Annual Income", context);
  }else{
      print("objecaaat");
      print(CarrierRegisterAPI(context));
      CarrierRegisterAPI(context);
      // registerAPI(context);
  }
  
}

CarrierRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiNmIyYjVmYWY1ZTU5MzQ0ZmViMTFjIiwiaWF0IjoxNjcyOTg4Mzg3LCJleHAiOjE2NzI5OTE5ODd9.8mNgZpSHjKW0I-D6zfSOMv3CijK8RovcFGy51WchOJI"};
  final data = {"educational_qualification": controller.dropdownValue20, "working_in": controller.dropdownValue21, "working_as": WorkingInController.text, "company_details": CompanydetailsController.text, "annual_income":AnnualIcome.text
  };
  final params ={ "carrier_and_working_details":data};
  print("Carrier Address API Params: ${params}");
  http.post(
      RestApiClient().registerUpdate,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Carrier Address: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          controller.currentStep = 5;
          print(controller.currentStep = 5);
          // Get.toNamed(RouteNames.welcome);
          showSuccessSnackBar("Carrier Details verified Succesfully", context);
          print("balaji");
      }else{
        showSnackBar(res["message"].toString(), context);
        print("object1");
      }
    }
  });

}

}