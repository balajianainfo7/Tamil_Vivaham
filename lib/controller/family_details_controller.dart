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

class FamilyRegisterController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController FatherNameController = TextEditingController(text: '');
  TextEditingController FatherOccupationController = TextEditingController(text: '');
  TextEditingController MotherNameController = TextEditingController(text: '');
  TextEditingController MotherOccupationController = TextEditingController(text: '');
  TextEditingController ExpectationController = TextEditingController(text: '');
 
  checkInput(context){
  if(FatherNameController.text.isEmpty){
    showSnackBar("Enter Father Name", context);
  }else if(FatherOccupationController.text.isEmpty){
    showSnackBar("Enter Father Occupation", context);
  }else if(MotherNameController.text.isEmpty){
    showSnackBar("Enter Mother Name", context);
  }else if(MotherOccupationController.text.isEmpty){
    showSnackBar("Enter Father Occupation", context);
  }else if(ExpectationController.text.isEmpty){
    showSnackBar("Enter Expectation", context);
  }else{
      print("objecaaat");
      print(FamilyRegisterAPI(context));
      FamilyRegisterAPI(context);
      // registerAPI(context);
  }
  
}

FamilyRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiNmIyYjVmYWY1ZTU5MzQ0ZmViMTFjIiwiaWF0IjoxNjcyOTg4Mzg3LCJleHAiOjE2NzI5OTE5ODd9.8mNgZpSHjKW0I-D6zfSOMv3CijK8RovcFGy51WchOJI"};
  final data = {"father_name": FatherNameController.text, "father_ocuupation": FatherOccupationController.text, "mother_name": MotherNameController.text, "mother_occupation": MotherOccupationController.text, "no_of_bro":controller.dropdownValue28
  ,"no_of_bro_married": controller.dropdownValue29, "no_of_sis": controller.dropdownValue30, "no_of_sis_married": controller.dropdownValue31, "own_vehicle": controller.dropdownValue32, "own_house": controller.dropdownValue33,"own_lands":controller.dropdownValue34, "own_flats":controller.dropdownValue35, "expectation":ExpectationController.text};
  final params ={ "family_details":data};
  print("Family Address API Params: ${params}");
  http.post(
      RestApiClient().registerUpdate,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Family Address: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          Get.toNamed(RouteNames.login);
          print("balaji");
      }else{
        showSnackBar(res["message"].toString(), context);
        print("object1");
      }
    }
  });

}

}