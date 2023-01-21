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


class PermenentAddressUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController DoorNoController = TextEditingController(text: '');
  TextEditingController StreetController = TextEditingController(text: '');
  TextEditingController AreaController = TextEditingController(text: '');
  TextEditingController CityController = TextEditingController(text: '');
  TextEditingController DistrictController = TextEditingController(text: '');
  TextEditingController StateController = TextEditingController(text: '');
  TextEditingController CountryController = TextEditingController(text: '');
  
 
  checkInput(context){
  if(DoorNoController.text.isEmpty){
    showSnackBar("Enter Door No Details", context);
  }else if(StreetController.text.isEmpty){
    showSnackBar("Enter Street Details", context);
  }else if(AreaController.text.isEmpty){
    showSnackBar("Enter Area Details", context);
  }else if(CityController.text.isEmpty){
    showSnackBar("Enter City Details", context);
  }else if(DistrictController.text.isEmpty){
    showSnackBar("Enter District Details", context);
  }else if(StateController.text.isEmpty){
    showSnackBar("Enter State Details", context);
  }else if(CountryController.text.isEmpty){
    showSnackBar("Enter Country Details", context);
  }else{
      print("objecaaat");
      print(PermenentUpdateControllerRegisterAPI(context));
      PermenentUpdateControllerRegisterAPI(context);
      // registerAPI(context);
  }
  
}

PermenentUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYmVlMDdjOWQ0MGQ5ZDBlMzI0MzBkIiwiaWF0IjoxNjczMzQ1NzA2LCJleHAiOjE2NzMzNDkzMDZ9.OR-AVIkZbQp3_Z4aSNWNVR3JarHozjifFT39b6ZdW-8"};
  final params = {"door_no": DoorNoController.text, "street": StreetController.text, "area": AreaController.text, "city": CityController.text, "district":DistrictController.text
  ,"state": StateController.text, "country": CountryController.text};
  
  print("Permenent Address API Params: ${params}");
  http.post(
      RestApiClient().permenentAddressEdit,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Permenent Address: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          showSuccessSnackBar("Permenent Address Details Updated Succesfully", context);
        Get.toNamed(RouteNames.profile);
          
      }else{
        showSnackBar(res["message"].toString(), context);
        
      }
    }
  });

}

}