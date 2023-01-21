import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/resources/app_routes.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';


class CarrierUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController EducationController = TextEditingController(text: '');
  TextEditingController WorkingInController = TextEditingController(text: '');
  TextEditingController WorkingAsController = TextEditingController(text: '');
  TextEditingController CompanyController = TextEditingController(text: '');
  TextEditingController IncomeController = TextEditingController(text: '');

  checkInput(context){
  if(EducationController.text.isEmpty){
    showSnackBar("Enter Education Details", context);
  }else if(WorkingInController.text.isEmpty){
    showSnackBar("Enter Working In Details", context);
  }else if(WorkingAsController.text.isEmpty){
    showSnackBar("Enter Working As Details", context);
  }else if(CompanyController.text.isEmpty){
    showSnackBar("Enter Company details Details", context);
  }else if(IncomeController.text.isEmpty){
    showSnackBar("Enter Annual Income Details", context);
  }else{
      print("objecaaat");
      print(CarrierUpdateControllerRegisterAPI(context));
      CarrierUpdateControllerRegisterAPI(context);
      // registerAPI(context);
  }
  
}

CarrierUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYmVlMDdjOWQ0MGQ5ZDBlMzI0MzBkIiwiaWF0IjoxNjczMzQ1NzA2LCJleHAiOjE2NzMzNDkzMDZ9.OR-AVIkZbQp3_Z4aSNWNVR3JarHozjifFT39b6ZdW-8"};
  final params = {"educational_qualification": EducationController.text, "working_in": WorkingInController.text, "working_as": WorkingAsController.text, "company_details": CompanyController.text, "annual_income":IncomeController.text
  };
  
  print("Carrier Address API Params: ${params}");
  http.post(
      RestApiClient().carrierEdit,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Carrier Address: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          showSuccessSnackBar("Carrier Details Updated Succesfully", context);
        Get.toNamed(RouteNames.profile);
          
      }else{
        showSnackBar(res["message"].toString(), context);
        
      }
    }
  });

}

}