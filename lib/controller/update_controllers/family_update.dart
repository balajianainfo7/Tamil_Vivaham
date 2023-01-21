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


class FamilyUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
 TextEditingController FatherNameController = TextEditingController(text: '');
  TextEditingController FatherOccupationController = TextEditingController(text: '');
  TextEditingController MotherNameController = TextEditingController(text: '');
  TextEditingController MotherOccupationController = TextEditingController(text: '');
  TextEditingController NoBroController = TextEditingController(text: '');
  TextEditingController BroMarryController = TextEditingController(text: '');
  TextEditingController NoSisController = TextEditingController(text: '');
  TextEditingController SisMarryController = TextEditingController(text: '');
  TextEditingController OwnVechileController = TextEditingController(text: '');
  TextEditingController OwnHouseController = TextEditingController(text: '');
  TextEditingController OwnlandsController = TextEditingController(text: '');
  TextEditingController OwnFlatsController = TextEditingController(text: '');
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
  }else if(NoBroController.text.isEmpty){
    showSnackBar("Enter No Brother", context);
  }else if(BroMarryController.text.isEmpty){
    showSnackBar("Enter Brother details", context);
  }else if(NoSisController.text.isEmpty){
    showSnackBar("Enter No Sister", context);
  }else if(SisMarryController.text.isEmpty){
    showSnackBar("Enter Brother details", context);
  }else if(OwnVechileController.text.isEmpty){
    showSnackBar("Enter Vechile", context);
  }else if(OwnHouseController.text.isEmpty){
    showSnackBar("Enter House", context);
  }else if(OwnlandsController.text.isEmpty){
    showSnackBar("Enter Lands", context);
  }else if(OwnFlatsController.text.isEmpty){
    showSnackBar("Enter Flats", context);
  }else if(ExpectationController.text.isEmpty){
    showSnackBar("Enter Expectation", context);
  }else{
      print("objecaaat");
      print(FamilyUpdateControllerRegisterAPI(context));
      FamilyUpdateControllerRegisterAPI(context);
      // registerAPI(context);
  }
  
}

FamilyUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiYmVlMDdjOWQ0MGQ5ZDBlMzI0MzBkIiwiaWF0IjoxNjczMzQ1NzA2LCJleHAiOjE2NzMzNDkzMDZ9.OR-AVIkZbQp3_Z4aSNWNVR3JarHozjifFT39b6ZdW-8"};
   final params = {"father_name": FatherNameController.text, "father_occupation": FatherOccupationController.text, "mother_name": MotherNameController.text, "mother_occupation": MotherOccupationController.text, "no_of_bro":NoBroController.text
  ,"no_of_bro_married": BroMarryController.text, "no_of_sis": NoSisController.text, "no_of_sis_married": SisMarryController.text, "own_vehicle": OwnVechileController.text, "own_house": OwnHouseController.text,"own_lands":OwnlandsController.text, "own_flats":OwnFlatsController.text, "expectation":ExpectationController.text};
  
  print("Family Address API Params: ${params}");
  http.post(
      RestApiClient().familyEdit,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Family Address: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          showSuccessSnackBar("Family Details Updated Succesfully", context);
        Get.toNamed(RouteNames.profile);
          
      }else{
        showSnackBar(res["message"].toString(), context);
        
      }
    }
  });

}

}