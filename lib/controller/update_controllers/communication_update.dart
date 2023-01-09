import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/controller/stepper_register_controller.dart';
import 'package:thirumanam/utils/api_config.dart';
import 'package:thirumanam/utils/utils.dart';
import 'package:validators/validators.dart';


class CommunicationUpdateController extends BaseController{
  final controller = Get.find<StepperRegisterController>();
  TextEditingController DoshamController = TextEditingController(text: '');
 
  checkInput(context){
  if(DoshamController.text.isEmpty){
    showSnackBar("Enter Dosham Details", context);
  }else{
      print("objecaaat");
      print(CommunicationUpdateControllerRegisterAPI(context));
      CommunicationUpdateControllerRegisterAPI(context);
      // registerAPI(context);
  }
  
}

CommunicationUpdateControllerRegisterAPI(context) async {
  final headers = {"x-access-token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXRhaWxzIjoiNjNiNmIyYjVmYWY1ZTU5MzQ0ZmViMTFjIiwiaWF0IjoxNjcyOTg4Mzg3LCJleHAiOjE2NzI5OTE5ODd9.8mNgZpSHjKW0I-D6zfSOMv3CijK8RovcFGy51WchOJI"};
  final data = {"rasi": controller.dropdownValue22, "natchathiram": controller.dropdownValue23, "laknam": controller.dropdownValue24, "gothram": controller.dropdownValue25, "kuladeivam":controller.dropdownValue26
  ,"dosham": controller.dropdownValue27, "dosham_details": DoshamController.text,};
  final params ={ "Communication_details":data};
  print("Communication Address API Params: ${params}");
  http.post(
      RestApiClient().registerUpdate,
      body: jsonEncode(params), headers: headers).then((value) {
    Map<String,dynamic> res = jsonDecode(value.body);
    print("value");
    print(value);
    print("Communication: ${res.toString()}");
    if (res != null) {
      if (res.isNotEmpty && res["status"].toString() != 410) {
          appPreference.accessToken = res["data"].toString();
          
      }else{
        showSnackBar(res["message"].toString(), context);
        
      }
    }
  });

}

}