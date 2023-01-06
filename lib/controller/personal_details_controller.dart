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

class PersonalRegisterController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController HeightController = TextEditingController(text: '');
  TextEditingController WeightController = TextEditingController(text: '');
  TextEditingController HobbiesController = TextEditingController(text: '');
  TextEditingController NoChildernController = TextEditingController(text: '');
  TextEditingController ChildernStatusController = TextEditingController(text: '');
  
  checkInput(context){
  if(HeightController.text.isEmpty){
    showSnackBar("Enter Height", context);
  }else if(WeightController.text.isEmpty){
    showSnackBar("Enter Weight", context);
  }else if(HobbiesController.text.isEmpty){
    showSnackBar("Enter Hobbies", context);
  }else if(NoChildernController.text.isEmpty){
    showSnackBar("Enter no of children", context);
  }else if(ChildernStatusController.text.isEmpty){
    showSnackBar("Enter children status", context);
  }else{
      print("objecaaat");
      print(personalRegisterAPI(context));
      personalRegisterAPI(context);
      // registerAPI(context);
  }
  
}

personalRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiNmIyYjVmYWY1ZTU5MzQ0ZmViMTFjIiwiaWF0IjoxNjcyOTg4Mzg3LCJleHAiOjE2NzI5OTE5ODd9.8mNgZpSHjKW0I-D6zfSOMv3CijK8RovcFGy51WchOJI"};
  final data = {"hobbies": HobbiesController.text, "diet": controller.dropdownValue18, "height": HeightController.text, "weight": WeightController.text, "marital_details":controller.dropdownValue19
  ,"no_of_children": NoChildernController.text, "skin_tone": controller.dropdownValue17, "children_status": ChildernStatusController.text};
  final params ={ "personal_details":data};
  print("Personal Address API Params: ${params}");
  http.post(
      RestApiClient().registerUpdate,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Personal Address: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          controller.currentStep = 4;
          print(controller.currentStep = 4);
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