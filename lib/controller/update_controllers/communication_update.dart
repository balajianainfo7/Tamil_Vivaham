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


class CommunicationUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController CasteController = TextEditingController(text: '');
  TextEditingController CommunityController = TextEditingController(text: '');
  TextEditingController MotherToungeController = TextEditingController(text: '');
  TextEditingController ReligionController = TextEditingController(text: '');
  TextEditingController SubCasteController = TextEditingController(text: '');
 
  checkInput(context){
  if(ReligionController.text.isEmpty){
    showSnackBar("Enter Religion Details", context);
  }else if(CommunityController.text.isEmpty){
    showSnackBar("Enter Community Details", context);
  }else if(MotherToungeController.text.isEmpty){
    showSnackBar("Enter Mother Tounge Details", context);
  }else if(CasteController.text.isEmpty){
    showSnackBar("Enter Caste Details", context);
  }else if(SubCasteController.text.isEmpty){
    showSnackBar("Enter SubCaste Details", context);
  }
  else{
      print("objecaaat");
      print(CommunicationUpdateControllerRegisterAPI(context));
      CommunicationUpdateControllerRegisterAPI(context);
      // registerAPI(context);
  }
  
}

CommunicationUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYmVlMDdjOWQ0MGQ5ZDBlMzI0MzBkIiwiaWF0IjoxNjczMzQ1NzA2LCJleHAiOjE2NzMzNDkzMDZ9.OR-AVIkZbQp3_Z4aSNWNVR3JarHozjifFT39b6ZdW-8"};
  final params = {"religion": ReligionController.text, "community": CommunityController.text, "mother_tounge": MotherToungeController.text, "caste": CasteController.text, "sub_caste":SubCasteController.text
  };
  
  print("Communication Address API Params: ${params}");
  http.post(
      RestApiClient().communcationEdit,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Communication: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
        showSuccessSnackBar("Comminication Details Updated Succesfully", context);
        Get.toNamed(RouteNames.profile);
      }else{
        showSnackBar(res["message"].toString(), context);
        
      }
    }
  });

}

}