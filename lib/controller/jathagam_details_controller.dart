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

class JathgamRegisterController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController DoshamController = TextEditingController(text: '');
 
  checkInput(context){
  if(DoshamController.text.isEmpty){
    showSnackBar("Enter Dosham Details", context);
  }else{
      print("objecaaat");
      print(JathgamRegisterAPI(context));
      JathgamRegisterAPI(context);
      // registerAPI(context);
  }
  
}

JathgamRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiNmIyYjVmYWY1ZTU5MzQ0ZmViMTFjIiwiaWF0IjoxNjcyOTg4Mzg3LCJleHAiOjE2NzI5OTE5ODd9.8mNgZpSHjKW0I-D6zfSOMv3CijK8RovcFGy51WchOJI"};
  final data = {"rasi": controller.dropdownValue22, "natchathiram": controller.dropdownValue23, "laknam": controller.dropdownValue24, "gothram": controller.dropdownValue25, "kuladeivam":controller.dropdownValue26
  ,"dosham": controller.dropdownValue27, "dosham_details": DoshamController.text,};
  final params ={ "jathagam_details":data};
  print("Jathgam Address API Params: ${params}");
  http.post(
      RestApiClient().registerUpdate,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Jathgam Address: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          controller.currentStep = 6;
          print(controller.currentStep = 6);
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