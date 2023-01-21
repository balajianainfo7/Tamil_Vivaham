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

class CommunicationRegisterController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController DoorNoController = TextEditingController(text: '');
  TextEditingController StreetController = TextEditingController(text: '');
  TextEditingController AreaController = TextEditingController(text: '');
  TextEditingController DoorNo1Controller = TextEditingController(text: '');
  TextEditingController Street1Controller = TextEditingController(text: '');
  TextEditingController Area1Controller = TextEditingController(text: '');
 
  checkInput(context){
  if(DoorNoController.text.isEmpty){
    showSnackBar("Enter Door Number", context);
  }else if(StreetController.text.isEmpty){
    showSnackBar("Enter Street Name", context);
  }else if(AreaController.text.isEmpty){
    showSnackBar("Enter Area Name", context);
  }else if(DoorNo1Controller.text.isEmpty){
    showSnackBar("Enter Door Number", context);
  }else if(Street1Controller.text.isEmpty){
    showSnackBar("Enter Street Name", context);
  }else if(Area1Controller.text.isEmpty){
    showSnackBar("Enter Area Name", context);
  }else{
      print("objecaaat");
      print(communicationRegisterAPI(context));
      communicationRegisterAPI(context);
      // registerAPI(context);
  }
  
}

communicationRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiNmIyYjVmYWY1ZTU5MzQ0ZmViMTFjIiwiaWF0IjoxNjcyOTg4Mzg3LCJleHAiOjE2NzI5OTE5ODd9.8mNgZpSHjKW0I-D6zfSOMv3CijK8RovcFGy51WchOJI"};
  final data = {"door_no": DoorNoController.text, "street": StreetController.text, "area": AreaController.text, "city": controller.dropdownValue7, "district":controller.dropdownValue8
  ,"state": controller.dropdownValue9, "country": controller.dropdownValue10, "nationality": controller.dropdownValue11};
  final data1 = {"door_no": DoorNo1Controller.text, "street": Street1Controller.text, "area": Area1Controller.text, "city": controller.dropdownValue12, "district":controller.dropdownValue13
  ,"state": controller.dropdownValue14, "country": controller.dropdownValue15};
  final params ={ "communication_detials":data,"permanent_address":data1 };
  print("Communication Address API Params: ${params}");
  http.post(
      RestApiClient().registerUpdate,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Communication Address: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          controller.currentStep = 3;
          print(controller.currentStep = 3);
          // Get.toNamed(RouteNames.welcome);
          showSuccessSnackBar("Address Details verified Succesfully", context);
          print("balaji");
      }else{
        showSnackBar(res["message"].toString(), context);
        print("object1");
      }
    }
  });

}

}