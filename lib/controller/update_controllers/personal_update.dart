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


class PersonalUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController HeightController = TextEditingController(text: '');
  TextEditingController WieghtController = TextEditingController(text: '');
  TextEditingController HobbiesController = TextEditingController(text: '');
  TextEditingController SkinController = TextEditingController(text: '');
  TextEditingController DeitController = TextEditingController(text: '');
  TextEditingController MartialController = TextEditingController(text: '');
  TextEditingController NoChildController = TextEditingController(text: '');
  TextEditingController ChildStatusController = TextEditingController(text: '');
 
  checkInput(context){
  if(HeightController.text.isEmpty){
    showSnackBar("Enter Height Details", context);
  }else if(WieghtController.text.isEmpty){
    showSnackBar("Enter Weight Details", context);
  }else if(HeightController.text.isEmpty){
    showSnackBar("Enter Hoobies Details", context);
  }else if(SkinController.text.isEmpty){
    showSnackBar("Enter Diet Details", context);
  }else if(DeitController.text.isEmpty){
    showSnackBar("Enter Skin Tone Details", context);
  }else if(MartialController.text.isEmpty){
    showSnackBar("Enter Martial Status Details", context);
  }else if(NoChildController.text.isEmpty){
    showSnackBar("Enter No of Children Details", context);
  }else if(ChildStatusController.text.isEmpty){
    showSnackBar("Enter Children Status Details", context);
  }else{
      print("objecaaat");
      print(PersonalUpdateControllerRegisterAPI(context));
      PersonalUpdateControllerRegisterAPI(context);
      // registerAPI(context);
  }
  
}

PersonalUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYmVlMDdjOWQ0MGQ5ZDBlMzI0MzBkIiwiaWF0IjoxNjczMzQ1NzA2LCJleHAiOjE2NzMzNDkzMDZ9.OR-AVIkZbQp3_Z4aSNWNVR3JarHozjifFT39b6ZdW-8"};
  final params = {"height": HeightController.text, "weight": WieghtController.text, "hobbies": HobbiesController.text, "diet": DeitController.text, "skin_tone":SkinController.text
  ,"marital_details": MartialController.text, "no_of_children": NoChildController.text, "children_status": ChildStatusController.text};
  
  print("Personal Address API Params: ${params}");
  http.post(
      RestApiClient().personalEdit,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Personal Address: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          showSuccessSnackBar("Personal Details Updated Succesfully", context);
        Get.toNamed(RouteNames.profile);
          
      }else{
        showSnackBar(res["message"].toString(), context);
        
      }
    }
  });

}

}